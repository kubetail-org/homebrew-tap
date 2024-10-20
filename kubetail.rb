# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubetail < Formula
  desc "Logging tool for Kubernetes"
  homepage "https://www.kubetail.com/"
  version "0.0.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/kubetail-org/kubetail/releases/download/0.8.0-rc1/kubetail-darwin-amd64"
      sha256 "3e80d762c2bfce3f301cfe0029d96e3cf76d51019fea2ae45aa9c2ef957b9dab"

      def install
        mv "kubetail-darwin-amd64", "kubetail"
        bin.install "kubetail"
      end
    end
    on_arm do
      url "https://github.com/kubetail-org/kubetail/releases/download/0.8.0-rc1/kubetail-darwin-arm64"
      sha256 "f6d925835ec1d9ebbc1f75cfa4b6cd9ef552943336913e85336f98dd5f10047c"

      def install
        mv "kubetail-darwin-arm64", "kubetail"
        bin.install "kubetail"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kubetail-org/kubetail/releases/download/0.8.0-rc1/kubetail-linux-amd64"
        sha256 "1e4ff3237efd6ca8bb06daea84cb05acc6ce90467e70bfe6640cf84338165785"

        def install
          mv "kubetail-linux-amd64", "kubetail"
          bin.install "kubetail"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kubetail-org/kubetail/releases/download/0.8.0-rc1/kubetail-linux-arm64"
        sha256 "24e0ae7c99c82a7cea250d1c532b216f0a9b95eb95df2709695dcb8ab84c6991"

        def install
          mv "kubetail-linux-arm64", "kubetail"
          bin.install "kubetail"
        end
      end
    end
  end

  def post_install
    generate_completions_from_executable(bin/"kubetail", "completion")
  end

  test do
    # Verify that the kubetail binary is executable and returns expected output for --version
    assert_match version.to_s, shell_output("#{bin}/kubetail --version")

    # Alternatively, you can test with the --help flag
    assert_match "Usage:", shell_output("#{bin}/kubetail --help")
  end
end
