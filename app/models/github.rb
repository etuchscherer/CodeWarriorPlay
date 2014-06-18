module Github
  include RestClient

  class Commits

    def initialize(_args = {})
      init_null_object _args
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

    def init_null_object(_args)
      @owner = _args[:owner] || ''
      @repo = _args[:repo] || ''
      @commits = _args[:commits] || []
    end

    def url_for_commits
      "https://api.github.com/repos/#{@owner}/#{@repo}/commits"
    end
  end

  class Sync
    def initialize(_args = {})
      init_null_object _args
    end

    def local_latest_sha
      %x(cd #{@project_path} && git rev-parse HEAD).chomp
    end

    def pull
      system "cd #{@project_path} && git pull"
    end

    def updated?
      remote = Github::Commits.new(owner: 'etuchscherer', repo: 'potholes')
      remote.fetch.last_commit_sha == local_latest_sha
    end

    private

    def init_null_object(_args)
      @project_path = _args[:project_path] || ''
    end
  end
end
