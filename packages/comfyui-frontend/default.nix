{ fetchFromGitHub, stdenv, nodejs, pnpm }:

stdenv.mkDerivation (finalAttrs: {
  pname="comfyui-frontend";
  version="1.34.2";
  
  src = fetchFromGitHub {
    owner = "Comfy-Org";
    repo = "ComfyUI_frontend";
    fetchSubmodules = false;
    rev = "7433f470fc990ab0ac84005de18bff2f94da41a0";
    hash = "sha256-USnaa2LvAzP3zm7GxFtrrPpWHvpr2T4VsdFkIHsH6yg=";
  };

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-2Lkujg4wGD14VCfVUSzkbZL45ZCARiySDSA/qeAOWxg=";
    fetcherVersion = 1;
  };

 	postBuild = ''
    pnpm run build
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/comfyui
    cp --archive dist $out/share/comfyui/web

    runHook postInstall
  ''; 

  patches = [
  ];
})
