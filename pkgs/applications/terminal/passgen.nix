{
  installShellFiles,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "password-generator-cli";
  version = "unstable";
  src = fetchFromGitHub {
    owner = "Pedr0Rocha";
    repo = pname;
    rev = "1eb310e059b7b7c5c67a0ead47d011211246ff5e";
    hash = "sha256-j7QlwCzTFu5cVq7U6pVXKsUaFYaXOMaRjrEGxsTs9gE=";
  };

  buildTarget = ".";

  vendorHash = "sha256-JFvC9V0xS8SZSdLsOtpyTrFzXjYAOaPQaJHdcnJzK3s=";
  doCheck = true;

  nativeBuildInputs = [installShellFiles];

  postInstall = ''
    mv $out/bin/${pname} $out/bin/passgen

    installShellCompletion --cmd passgen \
      --bash <($out/bin/passgen completion bash) \
      --zsh <($out/bin/passgen completion zsh)
  '';
}
