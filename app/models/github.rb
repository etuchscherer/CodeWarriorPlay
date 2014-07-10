module Github
  include RestClient

  def self.new_synchronizer(args = {})
    Sync.new(args)
  end

  class Commits

    def initialize(args = {})
      init_null_object args
    end

    def last_commit
      @commits.first || fail('No commits found')
    end

    def last_commit_sha
      last_commit.fetch('sha').chomp
    end

    def fetch
      @commits = JSON.parse(RestClient.get url_for_commits)
      self
    end

    private

    def init_null_object(args)
      @owner = args[:owner] || '' 
      @name = args[:name] || '' 
      @destination = args[:destination] || '' 
      @source = args[:source] || '' 
    end

    def url_for_commits
      "https://api.github.com/repos/#{@owner}/#{@name}/commits"
    end
  end

  class Sync
    def initialize(args = {})
      init_null_object args
    end

    def master_latest_sha
      remote = Github::Commits.new(owner: @owner, name: @name).fetch.last_commit_sha
    end

    def local_latest_sha
      %x(cd #{@destination} && git rev-parse HEAD).chomp
    end

    def pull
      system "cd #{@destination} && git pull"
    end

    def clone
      system "git clone #{@source} #{@destination}"
    end

    def updated?
      remote = Github::Commits.new(owner: @owner, name: @name)
      remote.fetch.last_commit_sha == local_latest_sha
    end

    private

    def init_null_object(args)
      @owner = args[:owner] ||  ''
      @name = args[:name] ||  ''
      @destination = args[:destination] ||  ''
      @source = args[:source] ||  ''
    end
  end
end
