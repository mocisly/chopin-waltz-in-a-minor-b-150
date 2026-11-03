\version "2.26.0"
\language "nederlands"
\pointAndClickOff
#(ly:set-option 'midi-extension "mid")

% Piano score. Absolute pitches; one numbered measure per line.
% Engraving and MIDI share the same music. Playback-only data is separate.
\header {
  title = \markup \override #'(font-name . "Times New Roman, Liberation Serif, C059")
    \abs-fontsize #24 "Waltz in A Minor"
  subtitle = \markup \override #'(font-name . "Times New Roman, Liberation Serif, C059")
    \abs-fontsize #14 "B. 150"
  composer = \markup \override #'(font-name . "Times New Roman, Liberation Serif, C059")
    \abs-fontsize #11.5 "Frédéric François Chopin"
  composerDates = \markup \override #'(font-name . "Times New Roman, Liberation Serif, C059")
    \abs-fontsize #11.5 "(1810 – 1849)"
  pdftitle = "Waltz in A Minor, B. 150"
  midititle = "Waltz in A Minor, B. 150"
  tagline = ##f
}

#(set-global-staff-size 20)
\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
  indent = 16.2\mm
  short-indent = 2.4\mm
  page-count = 2
  ragged-last = ##f
  ragged-bottom = ##f
  ragged-last-bottom = ##f
  print-first-page-number = ##f
  bookTitleMarkup = \markup \column {
    \fill-line { \fromproperty #'header:title }
    \vspace #0.8
    \overlay {
      \fill-line { \fromproperty #'header:subtitle }
      \fill-line { "" \fromproperty #'header:composer }
    }
    \vspace #0.7
    \fill-line { "" \fromproperty #'header:composerDates }
  }
  oddHeaderMarkup = ##f
  evenHeaderMarkup = ##f
  oddFooterMarkup = \markup \fill-line {
    "" \if \should-print-page-number \abs-fontsize #9 \fromproperty #'page:page-number-string
  }
  evenFooterMarkup = \markup \fill-line {
    \if \should-print-page-number \abs-fontsize #9 \fromproperty #'page:page-number-string ""
  }
  markup-system-spacing = #'((basic-distance . 8) (minimum-distance . 6) (padding . 2) (stretchability . 0))
  top-system-spacing = #'((basic-distance . 6) (minimum-distance . 4) (padding . 1))
  system-system-spacing = #'((basic-distance . 18) (minimum-distance . 12) (padding . 2) (stretchability . 30))
}

\layout {
  \context {
    \Score
    autoBeaming = ##f
    \override TupletBracket.bracket-visibility = ##f
    \override TupletBracket.direction = #DOWN
    \override TupletNumber.font-size = #-2
    \override BarNumber.font-size = #-2
  }
  \context {
    \PianoStaff
    \override StaffGrouper.staff-staff-spacing =
      #'((basic-distance . 10.5) (minimum-distance . 10.5) (padding . 2) (stretchability . 0))
  }
}

global = { \key a \minor \time 3/4 \partial 4 }

rightHand = {
  \global
  \clef treble
  \autoLineBreaksOff \autoPageBreaksOff
  \tempo "Allegretto"
  \stemUp e'4^( | % pickup
  a'8[ b'8] \stemDown c''4) c''4 | % 1
  d''8^([ e''8] f''2) | % 2
  b'8^([ c''8 d''8 a''8 g''8 f''8)] | % 3
  \slashedGrace { \stemUp e''16[ f''16] } \stemDown e''8^([ dis''!8] e''2) | % 4
  \break
  \stemUp a'8_([ b'8] \stemDown c''4) c''4 | % 5
  d''8^([ e''8] f''2) | % 6
  b'8^([ c''8 d''8 a''8 g''8 b'8] | % 7
  c''4) r4 \stemUp e'4^( | % 8
  a'8[ b'8] \stemDown c''4) c''4 | % 9
  \break
  d''8^([ e''8] f''2) | % 10
  b'8^([ c''8 d''8 a''8 g''8 f''8)] | % 11
  \slashedGrace { \stemUp e''16[ f''16] } \stemDown e''8^([ dis''!8] e''2) | % 12
  c''8^([ d''8] e''4) e''4 | % 13
  f''8^([ g''8] a''2) | % 14
  \break
  g''4 fis''!8^([ g''8 d'''8 f''!8)] | % 15
  e''2. | % 16
  \repeat volta 2 {
    e''8^([ fis''!8 gis''!8 a''8 b''8 c'''8] | % 17
    \slashedGrace { \stemUp b''16[ c'''16] } \stemDown b''8[ a''8 e''8 b''8)] a''4 | % 18
    \slashedGrace { \stemUp a''16[ b''16] } \stemDown a''8^([ gis''!8 e''8 f''8] e''4) | % 19
  \break
    \slashedGrace { \stemUp e''16[ f''16] } \stemDown e''8^([ c''8 a'8 b'8] \stemUp a'4) | % 20
    \tuplet 3/2 { e'8^([ gis'!8 b'8] } \once \override TupletNumber.extra-offset = #'(0 . -0.8) \tuplet 5/4 { \stemDown e''16[ gis''!16 b''16 \ottava #1 e'''16 gis'''!16] } b'''8.[ c''''16)] | % 21
    \slashedGrace { \stemUp b'''16[ c''''16] } \stemDown b'''8^([ a'''8 e'''8 b'''8)] a'''4 | % 22
    \slashedGrace { \stemUp a'''16[ b'''16] } \stemDown a'''8^([ gis'''!8 e'''8 e''''8] e''''4 | % 23
    a'''2) \ottava #0 r4 | % 24
  }
  \pageBreak
  \repeat volta 2 {
    \stemUp a'8_([ b'8] \stemDown c''4) c''4 | % 25
    d''8^([ e''8] f''2) | % 26
    b'8^([ c''8 d''8 a''8 g''8 f''8)] | % 27
    \slashedGrace { \stemUp e''16[ f''16] } \stemDown e''8^([ dis''!8] e''2) | % 28
    c''8^([ d''8] e''4) e''4 | % 29
    f''8^([ g''8] a''2) | % 30
  \break
    dis''!8^([ e''8] fis''!4) fis''4 | % 31
    gis''!8^([ a''8] b''2) | % 32
    \shape #'((0 . 0) (0 . 0.75) (0 . 0.75) (0 . 0)) Slur b''8^([ cis'''!8 d'''8 fis'''!8 e'''8 d'''8] | % 33
    cis'''!8^\prall[ b''8 cis'''8 gis''!8 a''8 fis''!8)] | % 34
    \slashedGrace { \stemUp e''16[ fis''!16] } \stemDown \shape #'((0 . 0) (0 . 0.5) (0 . 0.8) (0 . 0)) Slur e''8^([ d''8 gis'!8 fis''!8] e''4) | % 35
  \break
    \slashedGrace { \stemUp e''16[ fis''!16] } \stemDown \shape #'((0 . 0) (0 . 0.5) (0 . 0.8) (0 . 0)) Slur e''8^([ cis''!8 a'8 fis''!8] e''4) | % 36
    \shape #'((0 . 0) (0 . 0.75) (0 . 0.75) (0 . 0)) Slur b''8^([ cis'''!8 d'''8 fis'''!8 e'''8 d'''8] | % 37
    cis'''!8^\prall[ b''8 cis'''8 gis''!8 a''8 fis''!8)] | % 38
    \slashedGrace { \stemUp e''16[ fis''!16] } \stemDown e''8^([ d''8 gis'!8 fis''!8 e''8 gis'8] | % 39
    \stemUp a'4) r4 e'4 | % 40
  }
  \break
  a'8_([ b'8] \stemDown c''4) c''4 | % 41
  d''8^([ e''8] f''2) | % 42
  b'8^([ c''8 d''8 a''8 g''8 f''8)] | % 43
  \slashedGrace { \stemUp e''16[ f''16] } \stemDown e''8^([ dis''!8] e''2) | % 44
  \stemUp a'8_([ b'8] \stemDown c''4) c''4 | % 45
  d''8^([ e''8] f''2) | % 46
  \break
  b'8^([ c''8 d''8 a''8 g''8 b'8] | % 47
  c''4) r4 \stemUp e'4 | % 48
  a'8_([ b'8] \stemDown c''4) c''4 | % 49
  d''8^([ e''8] f''2) | % 50
  r8 e''8^(^\prall[ dis''!8 e''8 b''8 d''!8] | % 51
  \break
  c''2) r4 | % 52
  r8 c'''8^([ b''8 a''8 g''8 f''8] | % 53
  e''8[ d''8 cis''!8 d''8 e''8 f''8)] | % 54
  e''4^(\startTrillSpan dis''!8\stopTrillSpan[ e''8 f''8 gis'!8)] | % 55
  \stemUp a'2 r4 \bar "|." % 56
}

leftHand = {
  \global
  \clef bass
  r4 | % pickup
  \stemUp a,,4 \stemDown <a c' e'>4 <a c' e'>4 | % 1
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 2
  \stemUp g,4 \stemDown <g b f'>4 <g b f'>4 | % 3
  \stemUp c4 \stemDown <g c' e'>4 <g c' e'>4 | % 4
  \stemUp a,4 \stemDown <a c' e'>4 <a c' e'>4 | % 5
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 6
  \stemUp g,4 \stemDown <g b f'>4 <g d' f'>4 | % 7
  \stemUp c4 \stemDown <g c' e'>4 r4 | % 8
  \stemUp a,,4 \stemDown <a c' e'>4 <a c' e'>4 | % 9
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 10
  \stemUp g,4 \stemDown <g b f'>4 <g b f'>4 | % 11
  \stemUp c4 \stemDown <g c' e'>4 <g c' e'>4 | % 12
  \stemUp a,4 \stemDown <a c' e'>4 <a c' e'>4 | % 13
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 14
  \stemUp g,4 \stemDown <g b f'>4 <g b f'>4 | % 15
  \stemUp c4 \stemDown <g c' e'>4 <g c' e'>4 | % 16
  \repeat volta 2 {
    \stemUp e,4 \stemDown <e b d'>4 <e gis! d'>4 | % 17
    \stemUp a,4 \stemDown <e a c'>4 <e a c'>4 | % 18
    \stemUp e,4 \stemDown <e b d'>4 <e b d'>4 | % 19
    \stemUp a,4 \stemDown <e a c'>4 <e a c'>4 | % 20
    \stemUp e,4 \stemDown <e b d'>4 <e gis! d'>4 | % 21
    \stemUp a,4 \stemDown <e a c'>4 <e a c'>4 | % 22
    \stemUp e,4 \stemDown <e b d'>4 <e b d'>4 | % 23
    \stemUp a,4 \stemDown <e a c'>4 <e a c'>4 | % 24
  }
  \repeat volta 2 {
    \stemUp a,,4 \stemDown <a c' e'>4 <a c' e'>4 | % 25
    \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 26
    \stemUp g,4 \stemDown <g b f'>4 <g b f'>4 | % 27
    \stemUp c4 \stemDown <g c' e'>4 <g c' e'>4 | % 28
    \stemUp a,4 \stemDown <a c' e'>4 <a c' e'>4 | % 29
    \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 30
    \stemUp b,,4 \stemDown <a b dis'!>4 <a b dis'>4 | % 31
    \stemUp e,4 \stemDown <e b d'!>4 r4 | % 32
    \stemUp e,4 \stemDown <e gis! d'>4 <e gis d'>4 | % 33
    \stemUp a,4 \stemDown <e a cis'!>4 <e a cis'>4 | % 34
    \stemUp e,4 \stemDown <e b d'>4 <e b d'>4 | % 35
    \stemUp a,4 \stemDown <e a cis'!>4 <e a cis'>4 | % 36
    \stemUp e,4 \stemDown <e gis! d'>4 <e gis d'>4 | % 37
    \stemUp a,4 \stemDown <e a cis'!>4 <e a cis'>4 | % 38
    \stemUp e,4 \stemDown <e b d'>4 <e b d'>4 | % 39
    \stemUp a,4 \stemDown <e cis'!>4 r4 | % 40
  }
  \stemUp a,,4 \stemDown <a c' e'>4 <a c' e'>4 | % 41
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 42
  \stemUp g,4 \stemDown <g b f'>4 <g b f'>4 | % 43
  \stemUp c4 \stemDown <g c' e'>4 <g c' e'>4 | % 44
  \stemUp a,4 \stemDown <a c' e'>4 <a c' e'>4 | % 45
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 46
  \stemUp g,4 \stemDown <g b f'>4 <g d' f'>4 | % 47
  \stemUp c4 \stemDown <g e'>4 r4 | % 48
  \stemUp a,,4 \stemDown <a c' e'>4 <a c' e'>4 | % 49
  \stemUp d,4 \stemDown <a d' f'>4 <a d' f'>4 | % 50
  \stemUp e,4 \stemDown <e gis! d'?>4 <e gis d'>4 | % 51
  \stemUp a,4 \stemDown <e a c'>4 <e a c'>4 | % 52
  \stemUp c4 \stemDown <e a e'>4 r4 | % 53
  d4 <a b f'>4 r4 | % 54
  \stemUp e,4 \stemDown <e c'>4 <e b d'?>4 | % 55
  \stemUp a,4 \stemDown <e c'>4 r4 \bar "|." % 56
}

% Source contains pedal playback data, but no printed pedal marks.
% Each pattern is a single 3/4 measure, including the release at its end.
pedalMeasure = { s2.\sustainOn <>\sustainOff }
pedalPlayback = {
  \global
  s4
  \repeat unfold 16 { \pedalMeasure }
  \repeat volta 2 { \repeat unfold 8 { \pedalMeasure } }
  \repeat volta 2 { \repeat unfold 16 { \pedalMeasure } }
  \repeat unfold 16 { \pedalMeasure }
}

% The final numeric tempo changes belong only to playback.
playbackControls = {
  \global
  s4\p
  s2.*16
  \repeat volta 2 { s2.*8 }
  \repeat volta 2 { s2.*16 }
  s2.*14
  \tempo 4 = 102 s4
  \tempo 4 = 99 s8
  \tempo 4 = 96 s8
  \tempo 4 = 90 s8
  \tempo 4 = 84 s8
  \tempo 4 = 72 s2.
}

\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "upper" { \rightHand }
    \new Staff = "lower" { \leftHand }
  >>
  \layout { }
}

\score {
  \unfoldRepeats
  \new PianoStaff <<
    \new Staff \with { midiInstrument = "acoustic grand" } <<
      \new Voice { \rightHand }
      \new Voice { \playbackControls }
    >>
    \new Staff \with { midiInstrument = "acoustic grand" } <<
      \new Voice { \leftHand }
      \new Voice { \pedalPlayback }
    >>
  >>
  \midi { \tempo 4 = 108 }
}
