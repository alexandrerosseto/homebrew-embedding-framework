class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "a4de8a14d88b5c132597a41745769fa9eb0242275c5e147cadaaee3f1cb9bbe6"
  version "1.1.0-phase12-public-20260418-1928-homebrew-update-launcher"

  def install
    libexec.install Dir["bin", "lib", "README.md", "GETTING-STARTED.md", "GLOBAL-INSTALL.md", "LOCAL-INSTALL.md"]
    bin.write_exec_script(libexec/"bin/qdrant-setup")
    bin.write_exec_script(libexec/"bin/qdrant-update")
  end

  test do
    assert_match "qdrant-setup", shell_output("#{bin}/qdrant-setup --help")
    assert_match "qdrant-update", shell_output("#{bin}/qdrant-update --help")
  end
end
