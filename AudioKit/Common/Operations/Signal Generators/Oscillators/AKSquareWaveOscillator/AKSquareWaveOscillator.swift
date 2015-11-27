//
//  AKSquareWaveOscillator.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import AVFoundation

/** This is a bandlimited square oscillator ported from the "square" function from
 the Faust programming language. */
public class AKSquareWaveOscillator: AKOperation {

    // MARK: - Properties

    private var internalAU: AKSquareWaveOscillatorAudioUnit?
    private var token: AUParameterObserverToken?

    private var frequencyParameter: AUParameter?
    private var amplitudeParameter: AUParameter?
    private var pulseWidthParameter: AUParameter?

    /** In cycles per second, or Hz. */
    public var frequency: Float = 440 {
        didSet {
            frequencyParameter?.setValue(frequency, originator: token!)
        }
    }
    /** Output amplitude */
    public var amplitude: Float = 1.0 {
        didSet {
            amplitudeParameter?.setValue(amplitude, originator: token!)
        }
    }
    /** Duty cycle width (range 0-1). */
    public var pulseWidth: Float = 0.5 {
        didSet {
            pulseWidthParameter?.setValue(pulseWidth, originator: token!)
        }
    }

    // MARK: - Initializers

    /** Initialize this oscillator operation */
    public init(
        frequency: Float = 440,
        amplitude: Float = 1.0,
        pulseWidth: Float = 0.5) {

        self.frequency = frequency
        self.amplitude = amplitude
        self.pulseWidth = pulseWidth
        super.init()

        var description = AudioComponentDescription()
        description.componentType         = kAudioUnitType_Generator
        description.componentSubType      = 0x7371726f /*'sqro'*/
        description.componentManufacturer = 0x41754b74 /*'AuKt'*/
        description.componentFlags        = 0
        description.componentFlagsMask    = 0

        AUAudioUnit.registerSubclass(
            AKSquareWaveOscillatorAudioUnit.self,
            asComponentDescription: description,
            name: "Local AKSquareWaveOscillator",
            version: UInt32.max)

        AVAudioUnit.instantiateWithComponentDescription(description, options: []) {
            avAudioUnit, error in

            guard let avAudioUnitEffect = avAudioUnit else { return }

            self.output = avAudioUnitEffect
            self.internalAU = avAudioUnitEffect.AUAudioUnit as? AKSquareWaveOscillatorAudioUnit
            AKManager.sharedInstance.engine.attachNode(self.output!)
        }

        guard let tree = internalAU?.parameterTree else { return }

        frequencyParameter  = tree.valueForKey("frequency")  as? AUParameter
        amplitudeParameter  = tree.valueForKey("amplitude")  as? AUParameter
        pulseWidthParameter = tree.valueForKey("pulseWidth") as? AUParameter

        token = tree.tokenByAddingParameterObserver {
            address, value in

            dispatch_async(dispatch_get_main_queue()) {
                if address == self.frequencyParameter!.address {
                    self.frequency = value
                } else if address == self.amplitudeParameter!.address {
                    self.amplitude = value
                } else if address == self.pulseWidthParameter!.address {
                    self.pulseWidth = value
                }
            }
        }

    }
}
