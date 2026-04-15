class SystemZero < Formula
  desc "One-click autonomy and self-improvement for any repository"
  homepage "https://systemzero.dev"
  url "https://files.pythonhosted.org/packages/source/s/system-zero-cli/system_zero_cli-0.1.0.tar.gz"
  sha256 "f03e6d380a63dae6ad4fb06fa142e4da63adcc39865ee3d3632c29592f52d4a2"
  license "Apache-2.0"
  depends_on "pipx"

  def install
    (bin/"sz").write <<~EOS
      #!/usr/bin/env bash
      exec "#{Formula["pipx"].opt_bin}/pipx" run --spec system-zero-cli==0.1.0 sz "$@"
    EOS
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/sz --version")
  end
end
