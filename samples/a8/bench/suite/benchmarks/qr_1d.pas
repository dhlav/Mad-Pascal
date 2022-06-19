unit qr_1d;

//---------------------- COMMON INTERFACE --------------------------------------

{$i '../inc/header.inc'}

//---------------------- IMPLEMENTATION ----------------------------------------

const
  qr: array[0..174] of byte = (
    %11111111,%11111111,%11111111,%11111111,%11100000,
    %10000000,%10001010,%01111111,%00100000,%00100000,
    %10111110,%10001101,%00000111,%11101111,%10100000,
    %10100010,%10100100,%01001110,%01101000,%10100000,
    %10100010,%10010100,%01101101,%01101000,%10100000,
    %10100010,%11111100,%11101101,%00101000,%10100000,
    %10111110,%10110010,%01000010,%01101111,%10100000,
    %10000000,%10101010,%10101010,%10100000,%00100000,
    %11111111,%11011001,%10001111,%00111111,%11100000,
    %10011000,%11110100,%11010101,%00110100,%00100000,
    %10011001,%01001011,%00100111,%11011001,%10100000,
    %10100010,%10110011,%10011100,%11111010,%01100000,
    %10101111,%01100101,%01001111,%01011111,%00100000,
    %11101000,%00101000,%00010010,%10111100,%11100000,
    %10100011,%10011111,%10001011,%00000001,%10100000,
    %10110000,%10101100,%00001110,%01110010,%01100000,
    %10011001,%00101011,%10011110,%10100001,%00100000,
    %10110110,%00110010,%01000001,%11011011,%11100000,
    %10110111,%01011000,%11101010,%10111101,%10100000,
    %10111100,%00100111,%01011100,%11111010,%01100000,
    %10010001,%01111011,%01011000,%11110001,%11100000,
    %11100010,%10010101,%11010001,%00001011,%11100000,
    %10010101,%01001011,%00101101,%11011011,%10100000,
    %11101100,%10011110,%00111000,%11111011,%01100000,
    %11110111,%10100101,%10011101,%01111101,%11100000,
    %10001010,%11000111,%11010001,%10000010,%01100000,
    %11111111,%10011000,%10011111,%10111011,%01100000,
    %10000000,%11011101,%01011000,%10101000,%11100000,
    %10111110,%10111101,%01001000,%00111001,%00100000,
    %10100010,%10001000,%11001001,%10000011,%10100000,
    %10100010,%11010101,%00100111,%10111111,%00100000,
    %10100010,%11101010,%00011100,%10111101,%01100000,
    %10111110,%10010000,%01011100,%11000001,%11100000,
    %10000000,%10100010,%10110001,%11101111,%10100000,
    %11111111,%11111111,%11111111,%11111111,%11100000
  );

{$codealign proc = $100}

procedure benchmark;
var
  zb        : byte absolute counterLms + $24;
  zc        : byte absolute counterLms + $25;
  zd        : byte absolute counterLms + $26;
  ze        : byte absolute counterLms + $27;
  x         : byte absolute $e2;
  y         : byte absolute $e3;
  p         : PByte absolute $e0;

begin
  mode4;
  FillChar(pointer(counterLms + $23), 5, 0);
  rtclok := 0; y := %10000;
  while rtclok < 200 do begin
    p := pointer(lms);
    for x := 0 to 174 do begin
      p[x] := qr[x]; y := y shr 1;
      if y = 0 then begin
        inc(p,5); y := %10000;
      end;
    end;
    inc(ze);
    if ze = 10 then begin inc(zd); ze := 0 end;
    if zd = 10 then begin inc(zc); zd := 0 end;
    if zc = 10 then begin inc(zb); zc := 0 end;
  end;
end;

{$codealign proc = 0}

//---------------------- COMMON PROCEDURE --------------------------------------

{$i '../inc/run.inc'}

//---------------------- INITIALIZATION ----------------------------------------

initialization
  name := #$5c'QR 1D Array 200 frames'~;
  isRewritable := true;
end.
