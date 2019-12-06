fs = 8000;
bpm = 117;
timesPlayed = 4; %<-- only use powers of 2 numbers
melodyAmp = 50; %<-- change however you like--I prefer the bass to be slightly higher in this song
bassAmp = 80;

quarterNote = 60/bpm;
eigthNote = 30/bpm;
sixteenthNote = 15/bpm;
thirtysecondNote = 7.5/bpm;

%melodynotes
F4sixteenth = key2cos(45,melodyAmp,0,fs,sixteenthNote);
C5sixteenth = key2cos(52,melodyAmp,0,fs,sixteenthNote);
C5thirtysecond = key2cos(52,melodyAmp,0,fs,thirtysecondNote);
D5thirtysecond = key2cos(54,melodyAmp,0,fs,thirtysecondNote);
F5thirtysecond = key2cos(57,melodyAmp,0,fs,thirtysecondNote);
E5thirdsecond = key2cos(56,melodyAmp,0,fs,thirtysecondNote);
F5sixteenth = key2cos(57,melodyAmp,0,fs,sixteenthNote);
pauseSixteenth = key2cos(0,0,0,fs,sixteenthNote);
pauseEighth = key2cos(0,0,0,fs,eigthNote);


%bassnotes
B4sharpFull = [key2cos(50,bassAmp,0,fs,quarterNote*4) 0 0 0 0 0];
F4Full = [key2cos(45,bassAmp,0,fs,quarterNote*4) 0 0 0 0 0];
B3sharpFull = [key2cos(38,bassAmp,0,fs,quarterNote*4) 0 0 0 0 0];

F4threeQuarter = key2cos(45,bassAmp,0,fs,quarterNote*3);
C4threeQuarter = key2cos(40,bassAmp,0,fs,quarterNote*3);
F3threeQuarter = key2cos(33,bassAmp,0,fs,quarterNote*3);

C5oneQuarter = [key2cos(52,bassAmp,0,fs,quarterNote) 0 0 0 0 0]; %<--zero-padded so vectors are same length (required to be added, need to add to play at same time)
G4oneQuarter = [key2cos(47,bassAmp,0,fs,quarterNote) 0 0 0 0 0];
C4oneQuarter = [key2cos(40,bassAmp,0,fs,quarterNote) 0 0 0 0 0];



melody1 = [F4sixteenth F4sixteenth C5sixteenth C5sixteenth F5sixteenth F5sixteenth C5sixteenth C5sixteenth];
melody1bar = repmat(melody1, 1, 2); %<-- since *2 multiplies values, this allows you to repeat melodies
melody2pause = [pauseSixteenth pauseSixteenth pauseSixteenth pauseSixteenth]; 
melody2beat = [C5thirtysecond D5thirtysecond C5thirtysecond D5thirtysecond C5thirtysecond D5thirtysecond C5thirtysecond D5thirtysecond];
melody4beat = [pauseEighth C5thirtysecond D5thirtysecond C5thirtysecond D5thirtysecond F5thirtysecond E5thirdsecond F5thirtysecond E5thirdsecond F5sixteenth pauseSixteenth];
melody2bar1 = [melody2beat melody2pause melody2pause melody2beat];
melody2bar2 = [melody2pause melody2beat melody2pause melody2beat];
melody4bar = repmat(melody4beat, 1, 2);

melody1Full = repmat(melody1bar, 1, timesPlayed);
melody2Full = [melody2bar1 repmat(melody2bar2, 1, timesPlayed-1)];
melody3Full = repmat(melody2bar2, 1, timesPlayed);
melody4Full = repmat(melody4bar, 1, timesPlayed/2);
bothMelodiesFull = melody1Full + melody2Full;
bothMelodiesFull2 = melody1Full + melody3Full;
bothMelodiesFull3 = melody1Full(1:length(melody4Full)) + melody4Full;





bassChord1 = B4sharpFull + F4Full + B3sharpFull;
bassChord2 = F4threeQuarter + C4threeQuarter + F3threeQuarter;
bassChord3 = C5oneQuarter + G4oneQuarter + C4oneQuarter;
bass2bar = [bassChord2, bassChord3, bassChord1];
bassFull = repmat(bass2bar,1,timesPlayed/2);

fullSong = [melody1Full, bothMelodiesFull, bothMelodiesFull3, bothMelodiesFull2 + bassFull, bothMelodiesFull2 + bassFull];
soundsc(fullSong, fs)
plotspec(fullSong, fs, 512)
