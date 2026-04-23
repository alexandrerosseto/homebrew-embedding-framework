class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "9c2a2a2be9c489b6b420e43fddb67d15c693d4eb44341d79b5bec948cd081c20"
  version "1.1.0-phase12-public-20260423-1931-release-validation-isolation"

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
