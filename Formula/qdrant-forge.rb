class QdrantForge < Formula
  desc "Instalador standalone do embedding-framework para macOS"
  homepage "https://github.com/alexandrerosseto/embeddging-framework"
  url "https://github.com/alexandrerosseto/embeddging-framework/releases/latest/download/qdrant-forge.tar.gz"
  sha256 "50209ae0abc021b350d3e126be83ea0fd32f47e175106f8627a4bbf0db98f50c"
  version "1.1.0-phase12-public-20260405-1506-descriptor-reentry"

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
