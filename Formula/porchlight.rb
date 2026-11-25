class Porchlight < Formula
  desc "Keep Claude Code sessions ready on your Mac for the Claude mobile app"
  homepage "https://github.com/alejandrovdev/porchlight"
  url "https://github.com/alejandrovdev/porchlight.git",
      tag:      "v1.0.0",
      revision: "a11298482d8f054eac5f48e83343542184f24f6b"
  license "MIT"
  head "https://github.com/alejandrovdev/porchlight.git", branch: "main"

  depends_on :macos
  depends_on "python@3.15"
  depends_on "tmux"

  def python
    formula_opt_bin("python@3.15")/"python3.15"
  end

  def install
    libexec.install "porchlight"
    # -I keeps the person's PYTHONPATH and site packages out, and nothing is exported:
    # the sessions porchlight starts get the environment they would get anyway.
    (bin/"porchlight").write <<~SH
      #!/bin/sh
      exec "#{python}" -I -c 'import sys; sys.path.insert(0, sys.argv.pop(1)); from porchlight.cli import main; sys.exit(main(sys.argv[1:]))' "#{libexec}" "$@"
    SH
  end

  def caveats
    <<~EOS
      Set up once, then link each project from its folder:
        porchlight setup
        cd ~/path/to/project && porchlight init
      setup offers to install what is missing with Homebrew (Claude Code, git, tmux, Warp).
    EOS
  end

  test do
    assert_match "porchlight", shell_output("#{bin}/porchlight --version")
    ENV["PORCHLIGHT_CONFIG"] = testpath/"config.toml"
    ENV["PORCHLIGHT_STATE_DIR"] = testpath/"state"
    ENV["PORCHLIGHT_LOG_DIR"] = testpath/"logs"
    assert_match "No project", shell_output("#{bin}/porchlight status")
  end
end
