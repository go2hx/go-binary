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
			final cmd = 'GOOS=$GOOS GOARCH=$GOARCH go build -ldflags "-s -w" -o $exec cmd/go';
			Sys.println(cmd);
			Sys.command(cmd);
		}
	}
}