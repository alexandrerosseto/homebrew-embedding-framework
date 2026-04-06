class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "768fe85caa049e577d332c818df20a3b7ec54a5e017f7d6d0e4cf4670ee8f437"
  version "1.1.0-phase12-public-20260406-0037-prompts-dashboard-homebrew"

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
