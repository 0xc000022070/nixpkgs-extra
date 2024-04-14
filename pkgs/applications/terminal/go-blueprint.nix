{
  buildGoModule,
  fetchFromGitHub,
  installShellFiles,
}:
buildGoModule rec {
  pname = "go-blueprint";
  version = "0.5.12";
  src = fetchFromGitHub {
    owner = "Melkeydev";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-SLNvErOFJbXuzdkN4Kas2LhjF7eRdCUSuyTkT33/odY=";
  };

  buildTarget = ".";

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    installShellCompletion --cmd go-blueprint \
      --bash <($out/bin/go-blueprint completion bash) \
      --fish <($out/bin/go-blueprint completion fish) \
      --zsh <($out/bin/go-blueprint completion zsh)
  '';

  vendorHash = "sha256-WBzToupC1/O70OYHbKk7S73OEe7XRLAAbY5NoLL7xvw=";
  doCheck = true;
}
