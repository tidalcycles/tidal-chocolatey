/*
    Start the SuperDirt server by putting your cursor somewhere inside the text below,
    then press ctrl+enter on the keyboard.
*/

(
s.waitForBoot {
    ~dirt = SuperDirt(2, s);
	~dirt.loadSoundFiles("C:\\Users\\kindohm\\AppData\\Local\\SuperCollider\\downloaded-quarks\\Dirt-Samples\\*");
    s.sync;
    ~dirt.start(57120, [0, 0]);
}
)