class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "feffd0744fd621eee95b740b8cfdb5dbb3db40533ac92366213a06820990a054"
  version "0.0.0-dev"

  def install
    libexec.install Dir["bin", "lib", "README.md", "GETTING-STARTED.md", "GLOBAL-INSTALL.md", "LOCAL-INSTALL.md"]
    bin.write_exec_script(libexec/"bin/qdrant-setup")
  end

  test do
    assert_match "qdrant-setup", shell_output("#{bin}/qdrant-setup --help")
  end
end
