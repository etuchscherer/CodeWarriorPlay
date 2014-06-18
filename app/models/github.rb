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
			last_commit.fetch('sha')
		end

		def fetch
			@commits = JSON.parse(RestClient.get url_for_commits)
		end

		private

		def init_null_object(_args)
			@owner = _args[:owner] || ""
			@repo = _args[:repo] || ""
			@commit = _args[:commit] || []
		end

		def url_for_commits
			"https://api.github.com/repos/#{@owner}/#{@repo}/commits"
		end
	end
end
