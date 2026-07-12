import XCTest
@testable import SoundAmplifier

final class SoundAmplifierTests: XCTestCase {
    
    var audioEngine: AudioEngine?
    
    override func setUp() {
        super.setUp()
        audioEngine = AudioEngine()
    }
    
    override func tearDown() {
        audioEngine = nil
        super.tearDown()
    }
    
    func testAudioEngineInitialization() {
        XCTAssertNotNil(audioEngine)
        XCTAssertFalse(audioEngine!.isListening)
    }
    
    func testAmplificationRange() {
        XCTAssertGreaterThanOrEqual(1.0, 1.0)
        XCTAssertLessThanOrEqual(100.0, 100.0)
    }
    
    func testNoiseReductionModes() {
        let modes: [NoiseReductionMode] = [.off, .low, .medium, .high]
        XCTAssertEqual(modes.count, 4)
    }
    
    func testSettingsPersistence() {
        let settings = AppSettings()
        XCTAssertEqual(settings.defaultAmplification, 25.0)
        XCTAssertEqual(settings.voiceBoostDefault, 0.0)
        XCTAssertTrue(settings.darkModeEnabled)
    }
}
