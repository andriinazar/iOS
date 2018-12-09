//
//  Currencies.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

public class Currencies: Codable {
    let aed, amd, aud, azn: String?
    let bgn, brl, byn, cad: String?
    let chf, clp, cny, czk: String?
    let dkk, dzd, egp, eur: String?
    let gbp, gel, hkd, hrk: String?
    let huf, ils, inr, iqd: String?
    let jpy, kgs, krw, kwd: String?
    let kzt, lbp, mdl, mxn: String?
    let nok, nzd, pkr, pln: String?
    let ron, rub, sar, sek: String?
    let sgd, thb, tjs, currenciesTRY: String?
    let twd, usd, vnd: String?
    
    enum CodingKeys: String, CodingKey {
        case aed = "AED"
        case amd = "AMD"
        case aud = "AUD"
        case azn = "AZN"
        case bgn = "BGN"
        case brl = "BRL"
        case byn = "BYN"
        case cad = "CAD"
        case chf = "CHF"
        case clp = "CLP"
        case cny = "CNY"
        case czk = "CZK"
        case dkk = "DKK"
        case dzd = "DZD"
        case egp = "EGP"
        case eur = "EUR"
        case gbp = "GBP"
        case gel = "GEL"
        case hkd = "HKD"
        case hrk = "HRK"
        case huf = "HUF"
        case ils = "ILS"
        case inr = "INR"
        case iqd = "IQD"
        case jpy = "JPY"
        case kgs = "KGS"
        case krw = "KRW"
        case kwd = "KWD"
        case kzt = "KZT"
        case lbp = "LBP"
        case mdl = "MDL"
        case mxn = "MXN"
        case nok = "NOK"
        case nzd = "NZD"
        case pkr = "PKR"
        case pln = "PLN"
        case ron = "RON"
        case rub = "RUB"
        case sar = "SAR"
        case sek = "SEK"
        case sgd = "SGD"
        case thb = "THB"
        case tjs = "TJS"
        case currenciesTRY = "TRY"
        case twd = "TWD"
        case usd = "USD"
        case vnd = "VND"
    }
    
    init(aed: String?, amd: String?, aud: String?, azn: String?, bgn: String?, brl: String?, byn: String?, cad: String?, chf: String?, clp: String?, cny: String?, czk: String?, dkk: String?, dzd: String?, egp: String?, eur: String?, gbp: String?, gel: String?, hkd: String?, hrk: String?, huf: String?, ils: String?, inr: String?, iqd: String?, jpy: String?, kgs: String?, krw: String?, kwd: String?, kzt: String?, lbp: String?, mdl: String?, mxn: String?, nok: String?, nzd: String?, pkr: String?, pln: String?, ron: String?, rub: String?, sar: String?, sek: String?, sgd: String?, thb: String?, tjs: String?, currenciesTRY: String?, twd: String?, usd: String?, vnd: String?) {
        self.aed = aed
        self.amd = amd
        self.aud = aud
        self.azn = azn
        self.bgn = bgn
        self.brl = brl
        self.byn = byn
        self.cad = cad
        self.chf = chf
        self.clp = clp
        self.cny = cny
        self.czk = czk
        self.dkk = dkk
        self.dzd = dzd
        self.egp = egp
        self.eur = eur
        self.gbp = gbp
        self.gel = gel
        self.hkd = hkd
        self.hrk = hrk
        self.huf = huf
        self.ils = ils
        self.inr = inr
        self.iqd = iqd
        self.jpy = jpy
        self.kgs = kgs
        self.krw = krw
        self.kwd = kwd
        self.kzt = kzt
        self.lbp = lbp
        self.mdl = mdl
        self.mxn = mxn
        self.nok = nok
        self.nzd = nzd
        self.pkr = pkr
        self.pln = pln
        self.ron = ron
        self.rub = rub
        self.sar = sar
        self.sek = sek
        self.sgd = sgd
        self.thb = thb
        self.tjs = tjs
        self.currenciesTRY = currenciesTRY
        self.twd = twd
        self.usd = usd
        self.vnd = vnd
    }
}
