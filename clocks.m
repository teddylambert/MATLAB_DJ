fs = 8000;
bpm = 130;
melodyAmp = 50;
bassAmp = 70;
timesPlayed = 2;

fullNote = 240/bpm;
quarterNote = 60/bpm;
eigthNote = 30/bpm;
sixteenthNote = 15/bpm;
thirtysecondNote = 7.5/bpm;

%melody notes
E5FlatEigth = key2cos(55, melodyAmp, 0, fs, eigthNote);
B4FlatEigth = key2cos(50, melodyAmp, 0, fs, eigthNote);
G4Eigth = key2cos(47, melodyAmp, 0, fs, eigthNote);

D5FlatEigth = key2cos(53, melodyAmp, 0, fs, eigthNote);
F4Eigth = key2cos(45, melodyAmp, 0, fs, eigthNote);

C5Eigth = key2cos(52, melodyAmp, 0 ,fs, eigthNote);
A4FlatEight = key2cos(48, melodyAmp, 0, fs, eigthNote);

%bass notes
E3FlatFull = [key2cos(31, bassAmp, 0, fs, fullNote) 0 0 0 0 0 0];
B2FlatFull = [key2cos(26, bassAmp, 0, fs, fullNote) 0 0 0 0 0 0];
F3Full = [key2cos(33, bassAmp, 0, fs, fullNote) 0 0 0 0 0 0];

bar1 = [E5FlatEigth, B4FlatEigth, G4Eigth, E5FlatEigth B4FlatEigth G4Eigth E5FlatEigth B4FlatEigth];
bar2 = [D5FlatEigth B4FlatEigth F4Eigth D5FlatEigth B4FlatEigth F4Eigth D5FlatEigth B4FlatEigth];
bar3 = [D5FlatEigth B4FlatEigth F4Eigth D5FlatEigth B4FlatEigth F4Eigth D5FlatEigth B4FlatEigth];
bar4 = [C5Eigth A4FlatEight F4Eigth C5Eigth A4FlatEight F4Eigth C5Eigth A4FlatEight];

melody = [bar1,bar2,bar3,bar4];
melodyFull = repmat(melody, 1, timesPlayed);
bass = [E3FlatFull B2FlatFull B2FlatFull F3Full];
bassFull = repmat(bass, 1, timesPlayed);

song = melodyFull + bassFull;

soundsc(song, 8000);
plotspec(song, fs, 512);
