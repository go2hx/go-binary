function main() {
    buildBinary();
}

function buildBinary() {
    final GOOS_LIST = [
		"linux",
		"windows",
		"darwin",
	];
	final GOARCH_LIST = [
		"amd64",
		"arm64",
	];
	for (GOOS in GOOS_LIST) {
		for (GOARCH in GOARCH_LIST) {
			final exec = 'go.${GOOS}_$GOARCH';
			var ext = "";
			if (GOOS == "windows")
				ext = ".exe";
			final cmd = 'GOOS=$GOOS GOARCH=$GOARCH go build -ldflags "-s -w" -o $exec cmd/go' + ext;
			Sys.println(cmd);
			Sys.command(cmd);
		}
	}
}