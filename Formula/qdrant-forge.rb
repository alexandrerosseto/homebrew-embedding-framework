class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "8bffaf6db58c33122dfea57ff308344fb7f15585ad00b90972ddd03ed450ee6f"
  version "phase-12-safe-runtime-discover-followups"

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
