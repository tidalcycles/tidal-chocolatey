if(Quarks.isInstalled("SuperDirt").not) {
	Quarks.install("SuperDirt", "v1.7.3");
	thisProcess.recompile;
} {
  "SuperDirt installation complete!".postln;
  thisProcess.shutdown;
  0.exit;
};
