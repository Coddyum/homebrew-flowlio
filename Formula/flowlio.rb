class Flowlio < Formula
  desc "Project manager for AI agents: cross-repo issues, and a waker that closes the loop"
  homepage "https://github.com/Coddyum/flowlio-agents"
  url "https://github.com/Coddyum/flowlio-agents/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "0d24c969100123a9a6c1f3430a041d7314ed8bb269ba3520da5b466ecec46544"
  license "AGPL-3.0-only"
  head "https://github.com/Coddyum/flowlio-agents.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"flowlio"), "./cmd/flowlio"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"flowlio-api"), "./cmd/api"
  end

  def caveats
    <<~EOS
      Self-host runs Postgres 18 in a container flowlio manages — install Docker first, then:

        flowlio

      One repository at a time is made operational from its root with:

        flowlio connect <REPO>
    EOS
  end

  test do
    assert_match "flowlio", shell_output("#{bin}/flowlio version")
  end
end
