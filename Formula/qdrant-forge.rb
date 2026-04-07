class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "a74669f4a9e19849d97ba693f5214544a7b151be51d2108ee225ac348346383c"
  version "1.1.0-phase12-public-20260406-2117-homebrew-global-registry"

  def install
    libexec.install Dir["bin", "lib", "README.md", "GETTING-STARTED.md", "GLOBAL-INSTALL.md", "LOCAL-INSTALL.md"]
    bin.write_exec_script(libexec/"bin/qdrant-setup")
  end

  test do
    assert_match "qdrant-setup", shell_output("#{bin}/qdrant-setup --help")
  end
end
