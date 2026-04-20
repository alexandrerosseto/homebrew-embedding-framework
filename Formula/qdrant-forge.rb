class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "c6f24144e6bc20e2b797b9b326dfdd96c0f8dd7d6ca65e47138203ca9c7984e8"
  version "1.1.0-phase12.1-public-20260420-0404-published-refresh"

  def install
    libexec.install Dir["bin", "lib", "README.md", "GETTING-STARTED.md", "GLOBAL-INSTALL.md", "LOCAL-INSTALL.md"]
    bin.write_exec_script(libexec/"bin/qdrant-setup")
    bin.write_exec_script(libexec/"bin/qdrant-update")
    bin.write_exec_script(libexec/"bin/qdrant-health")
  end

  test do
    assert_match "qdrant-setup", shell_output("#{bin}/qdrant-setup --help")
    assert_match "qdrant-update", shell_output("#{bin}/qdrant-update --help")
    assert_match "qdrant-health", shell_output("ls #{bin}")
  end
end
