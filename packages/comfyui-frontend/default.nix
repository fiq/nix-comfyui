{ buildNpmPackage, fetchFromGitHub }:

buildNpmPackage {
  name = "comfyui-frontend";

  src = fetchFromGitHub {
    owner = "Comfy-Org";
    repo = "ComfyUI_frontend";
    fetchSubmodules = false;
    rev = "7433f470fc990ab0ac84005de18bff2f94da41a0";
    hash = "sha256-USnaa2LvAzP3zm7GxFtrrPpWHvpr2T4VsdFkIHsH6yg=";
  };

  npmDepsHash = "sha256-wHVfxjt77pt5T2Co4+4z2OJuwbvoqny3PPVAJA/lgwc=";

  patches = [
  ];

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/share/comfyui
    cp --archive dist $out/share/comfyui/web

    runHook postInstall
  '';
}
