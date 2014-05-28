class Git
  def status(target)
    system "cd #{target} && git status"
  end

  def pull(target)
    system "cd #{target} && git pull"
  end

  def remote_v(from)
    %x(cd #{from} && git ls-remote https://github.com/etuchscherer/Play.git | head -1 | awk '{print \$1}')
  end

  def local_v(from)
    %x(cd #{from} && git log | head -1 | awk '{print $2}')
  end
end
