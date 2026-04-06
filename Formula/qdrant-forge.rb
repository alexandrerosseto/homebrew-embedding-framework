class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "8fae8abeaa3f2576ef5570400ba540d8ec7305d2529077c3cdb5457e3c59dfa8"
  version "1.1.0-phase12-public-20260406-1659-dashboard-global-registry"

  def install
    libexec.install Dir["bin", "lib", "README.md", "GETTING-STARTED.md", "GLOBAL-INSTALL.md", "LOCAL-INSTALL.md"]
    bin.write_exec_script(libexec/"bin/qdrant-setup")
  end

  def uninstall
    env = {
      "FORGE_AUTO_UNINSTALL_SUITE" => "true",
      "FORGE_NO_SELF_REMOVE" => "true"
    }
    system env, libexec/"bin/qdrant-setup", "--uninstall"
  end

  test do
    assert_match "qdrant-setup", shell_output("#{bin}/qdrant-setup --help")
  end
end
