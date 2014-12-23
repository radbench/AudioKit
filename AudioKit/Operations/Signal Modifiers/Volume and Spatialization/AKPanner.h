//
//  AKPanner.h
//  AudioKit
//
//  Auto-generated on 12/23/14.
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

#import "AKStereoAudio.h"
#import "AKParameter+Operation.h"

/** Distribute an audio signal across two channels with a choice of methods.

 Panning methods include equal power, square root, simple linear, and an alternative equal power method based on the MIDI Association Recommend Practice for GM2 RP036 (Default Pan Curve).
 */

@interface AKPanner : AKStereoAudio
/// Instantiates the panner with all values
/// @param audioSource Source signal. [Default Value: ]
/// @param pan From hard left (-1) to middle (0) to hard right (1). [Default Value: 0]
/// @param panMethod AKPanMethod can be EqualPower, SquareRoot, Linear, AltEqualPower [Default Value: AKPanMethodEqualPower]
- (instancetype)initWithAudioSource:(AKParameter *)audioSource
                                pan:(AKParameter *)pan
                          panMethod:(AKPanMethod)panMethod;

/// Instantiates the panner with default values
/// @param audioSource Source signal.
- (instancetype)initWithAudioSource:(AKParameter *)audioSource;

/// Instantiates the panner with default values
/// @param audioSource Source signal.
+ (instancetype)stereoaudioWithAudioSource:(AKParameter *)audioSource;

/// From hard left (-1) to middle (0) to hard right (1). [Default Value: 0]
@property AKParameter *pan;

/// Set an optional pan
/// @param pan From hard left (-1) to middle (0) to hard right (1). [Default Value: 0]
- (void)setOptionalPan:(AKParameter *)pan;

/// AKPanMethod can be EqualPower, SquareRoot, Linear, AltEqualPower [Default Value: AKPanMethodEqualPower]
@property AKPanMethod panMethod;

/// Set an optional pan method
/// @param panMethod AKPanMethod can be EqualPower, SquareRoot, Linear, AltEqualPower [Default Value: AKPanMethodEqualPower]
- (void)setOptionalPanMethod:(AKPanMethod)panMethod;



@end
