//
//  SettingsStorage.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 02.04.2024.
//

import Foundation

class SettingsStorage {
    static let termsOfService = "These Terms of Service ('Terms') govern your access to and use of Ancient Lands: Card Adventures ('the App'), including any content, functionality, and services offered through the App. By accessing or using the App, you agree to be bound by these Terms.\n\n1. Use of the App\n\nYou agree to use the App solely for lawful purposes and in accordance with these Terms. You may not use the App in any manner that could damage, disable, overburden, or impair the App, or interfere with any other party's use of the App.\n\n2. Intellectual Property Rights\n\nThe App and its original content, features, and functionality are owned by Yaroslav Chlek and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.\n\n3. App Store\n\nYou acknowledge and agree that these Terms are between you and Yaroslav Chlek, and not with Apple Inc. You further acknowledge and agree that Apple Inc. has no obligation whatsoever to furnish any maintenance and support services with respect to the App."
    
    static let privacyPolicy = "We do not collect any personal information from users of the App. The App may use third-party services that may collect information used to identify you.\n\nChanges to Terms and Privacy Policy\n\nWe reserve the right, at our sole discretion, to modify or replace these Terms and Privacy Policy at any time. By continuing to access or use the App after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use the App.\n\nContact Us\n\nIf you have any questions about these Terms or Privacy Policy, please contact us at ancientlandscardadventures@gmail.com.\n\nThese Terms and Privacy Policy were last updated on 01.04.2024."
    
    static let rules: Array<(String, String)> = [
        ("screen1", "You can navigate through the locations using the coordinating buttons under the story card. On the top right is the inventory, it's always good to know what you have on hand."),
        ("screen2", "By clicking on a character's avatar, you can view their current characterization. This can also be done by tapping on a card in the inventory or by tapping on the card selection areas."),
        ("screen3", "Chests are a very useful thing. They allow you to get new things, also you can meet a rare chest, in which you can find a lot of useful things. But in this world, even opening a chest is not an easy task."),
        ("screen4", "You will also encounter enemies along the way, if you spot one earlier you can set a trap, depending on your skills - the enemy may get caught in it or spotted."),
        ("screen5", "Combat is an important element of this game, during your turn you can choose one type of weapon to fight with in that turn, during your opponent's turn, you can put up a shield. Don't forget to look in your inventory, some items can be equipped, for example armor will give you extra protection."),
    ]
}
