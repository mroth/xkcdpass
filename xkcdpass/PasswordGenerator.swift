//
//  PasswordGenerator.swift
//  xkcdpass
//
//  Created by Matthew Rothenberg on 2/5/15.
//  Copyright (c) 2015 Matthew Rothenberg. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    /*
    MARK: Adjustable Properties
    */
    /// Number of distinct words to be used when generating a passphrase.
    var numWords: Int = 4
    
    /// Minimum length for candidate words to be included in a passphrase.
    var minWordLength: Int = 4 {
        didSet { candidateWords = generateCandidateWords() }
    }
    
    /// Maximum length for candidate words to be included in a passphrase.
    var maxWordLength: Int = 8 {
        didSet { candidateWords = generateCandidateWords() }
    }
    

    // MARK: Constants

    /// raw word list of 10K most common words, from Google corpus
    private let wordList =
		(try! String( contentsOfFile:
            Bundle.main.path(forResource: "google-10000-english", ofType: "txt")!,
		encoding: .utf8))
		.components(separatedBy: "\n")
    
    /// candidateWords is lazily generated upon first usage.
    /// (adjusting min or max word length will auto-regenerate.)
    private lazy var candidateWords: [String] = generateCandidateWords()
    
    
    // MARK: Computed Properties

    /// Number of candidate words currently available for passphrase generation.
    var numCandidates: Int { candidateWords.count }
    
    /**
    Level of entropy for passphrases generated with current settings.
    
    Reported in approximate "bits of entropy," e.g. 2^N possibilities.
    
    This should be equivalent to a random password that was generated with C
    possible characters per position of N length, for example for a password 
    of 8 characters long that contains only alphanumerics of any case,
    e.g. [A-Za-z0-9]{8}, e.g. `pwgen --secure`.
    
        p = 62 ^ 8   = 218340105584896
        e = log2(p)  = 47.6
    
    Yielding approximately 48 bits of entropy.
    
    To get an equivalent number of possibilities for XKCD passphrases, we look 
    at the possible word choices for the passphrase as C, and the number of 
    words as N. For example, in the comic example where "correct horse staple 
    battery" is selected from 2048 possible words in a wordlist:
    
        p = 2048 ^ 4 = 17592186044416
        e = log2(p)  = 44.0
    
    Yielding approximately 44 bits of entropy.
    */
    var entropy: Double {
        log2(pow(Double(numCandidates), Double(numWords)))
    }
    
    
    // MARK: Functions
    
    /// Generates list of candidate words based on current setting properties.
    internal func generateCandidateWords() -> [String] {
        wordList.filter {
            $0.utf16.count <= maxWordLength &&
            $0.utf16.count >= minWordLength
        }
    }
    
    /// Generates passphrase containing the default number of words.
    func phrase() -> String {
		randomWords(numWords).joined(separator: " ")
    }
    
    /// Selects a number of random words from the current candidates.
    ///
    /// - parameter n: the number of words to select.
    /// - returns: An array of randomly selected words.
    func randomWords(_ n: Int) -> [String] {
		(1...n).compactMap { _ in
			candidateWords.randomElement()
		}
    }
}
