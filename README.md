# en-subordinationstrategies-mw

# Middle Welsh Data on non-finite subordination strategies

The data and script provided here is taken from my phD-thesis 'Non-finite Subordination Strategies in Middle Welsh. A Corpus-Based Study of Preposition or Particle yn and the Verbal Noun.'

## Data Collection

The data collection provided here is taken from different sources: 

1) Brut y Brenhinedd (BrutRB)
 as found in the Red Book of Hergest, accessed via http://www.rhyddiaithganoloesol.caerdydd.ac.uk/en/ms-page.php?ms=Jesus111&page=8v&l=c31l1 

2) Pedeir Keinc Y Mabinogi (PKM)
from Pedeir Keinc Y Mabinogi. Allan o Lyfr Gwyn Rhydderch
Williams, Ifor (1930, 2nd edition 1951), Caerdydd: Gwasg Prifysgol Cymru, and its digitised version on http://titus.uni-frankfurt.de/texte/etcs/celt/mcymr/pkm/pkm.htm 
 and http://www.rhyddiaithganoloesol.caerdydd.ac.uk/en/ms-page.php?ms=Pen4&page=1r&l=c1l1

3) Breuddwyd Maxen Wledig (BMW)
Ifor Williams, ed. (1927). Breuddwyd Maxen. Bangor: Jarvis & Foster; corrected with its digitised manuscript available at http://www.rhyddiaithganoloesol.caerdydd.ac.uk/en/ms-page.php?ms=Pen4&page=45r 

4) Ystorya Gereint uab Erbin (Ger)
Robert L. Thomson, ed. (1997b). Ystorya Gereint uab Erbin. Dublin: Dublin Institute for Advanced Studies; up to page 29 line 808

The data sets have been acquired manually by reading and analysing the texts and choosing those cases in which 'preposition/particle (+ possessive pronoun) + verbal noun' express subordinate relations. Aspectual constructions are not part of the data collection.

## Decisions for data acquisition

 

motion-and-purpose: motion verbs followed by a PPVN are only tagged as such when there is no adverbial phrase preceding the PPVN; if there is an adverbial between the motion verb and the PPVN it is analysed as an adverbial use of PPVN; in the case of an adjunct the fields 'matrix verb' and 'matrix' are still annotated



fossilised phrases such as heb ouyn 'without fear(ing)', ymdaith 'go out' or cases in which the noun and VN are homonymous, but the use is clearly nominal due to the use of determiners or in coordination with another nominal have not been collected, as for example with heb annod 'without delay(ing)' in RBB 44.32-33 a heb annot ymlad a wnaethant yn drut ac yn galet 'and without delay they attacked bodly and hard'.




## Data entry in the file 

ID: ID given in the data base

TextID: source text (BrutRB, PKM, BMW or Ger)

passage: page number/folio.linenumber
text_type: historic-translation (BrutRB) or narrative-native (PKM, BMW or Ger)

context: complex sentence or paragraph in which the PPVN-phrase occurs

PPVN-phrase: the specific PPVN-phrase analysed

preposition: preposition or particle used in the PPVN-phrase
translation: English translation of the complex sentence or paragraph

Reeve_Wright2007: This column provides the Latin text of Historia Regum Britanniae, taken from Reeve, Michael D., ed. (2007). Geoffrey of Monmouth. The History of the Kings of Britain. Trans. by Neil Wright. Woodbridge: The Boydell Press, to compare the Latin and Middle Welsh text for selected passages of BrutRB.



translation_latin: 	This column provides the English translation of the Latin text of Historia Regum Britanniae, provided from Reeve, Michael D., ed. (2007). Geoffrey of Monmouth. The History of the Kings of Britain. Trans. by Neil Wright. Woodbridge: The Boydell Press.


length: This column provides the length of the PPVN-phrase. The preposition/particle or the connector a(c) in absolute relations, cliticised elements, such as infixed pronouns or cliticised definite articles, have been counted as individual elements. If we find a PPVN-phrase which includes two verbal nouns in coordination without the repetition of the preposition/particle the entire construction was counted.

syntactic_relation: This column provides the syntactic analysis of the relation of the PPVN to its superordinate SoA as absolute, adnominal, adjunct, complement, absolute/aspectual, absolute/compl, adnominal/adjunct, adjunct/compl/adnom, or N/A.

iconicity: iconicity refers to the order of the super- and subordinate SoAs as super–sub, sub–super, integrated, surrounding, NP–sub–super, ADV–sub–super, or  Ø–sub-super. 
Integrated describes orderings in which the subordinate SoA is placed within the superordinate SoA. Surrounding is used for cases in which the subordinate SoA wraps itself around its superordinate SoA. In NP–sub–super, a noun phrase, usually the S/A-argument of the superodinate SoA,  precedes the subordinate SoA. In cases of ADV–sub–super, an adverbial phrase precedes the subordinate SoA, while Ø–sub-super describe cases in which a gapped argument precedes the subordinate SoA.


semantic_relation: This column provides information on the semantic relation of the subordinate SoA to its superordinate SoA. 

 Absolute relations are classed either co-temp (formed with yn) or as after (formed with gwedy).

 Adnominal may be either appositive or restrictive.

 Adjunct relations are classed as adversative, avertive, causal, conditional, contrastive, instrumental, manner, location, proposition modal, purpose, temporal, temporal point, or copredicative.

 Complement relations were analysed as commentative, knowledge, manipulative, perception, phasal, utterance, motion or other.

matrix: This column lists the predicate of the superordinate SoA. It  was consistently filled out for complement relations and adjunct relations which use a verb of motion in the superordinate SoA. Some further notes have been made for adversative relations as well as attending circumstance, manner, instrumental and copredicatives. 
 
matrix verb: This column lists the type of predicate of the superordinate SoA. It was consistently filled out for complement relations and adjunct relations which use a verb of motion in the superordinate SoA. For some other adjunct relations this column has been used, but not thoroughly.

agent focus: This column was only filled out in conjunction with the column 'sharing'. Cases of implicit S/A-argument in the subordinate Soa (S/A(sub)implicit) were further analysed as internal identification, Underspecified – Impersonal, contextual identification, or generic S/A. 

sharing/function1_super/function1_S/Asub: These columns provide information on the sharing of participants between sub- and superordinate SoA. More specifically, it looks at what argument in the superordinate SoA is co-referent with the S/A-argument of the subordinate SoA. If there is no sharing of the S/A-argument of the subordinate SoA it is labelled either No-co-ref (the superordinate SoA does not express an event of an animate or human S/A) or NoS/A(sub)-co-ref (the superordinate SoA involves an animate or human S/A, but it is not co-referent with the S/A-argument of the subordinate SoA). Columns function1_super and function1_S/Asub provide the same information of the shared S/A-argument, however separated into two columns. If there is no S/A-argument shared, the cells are left blank.  Types of sharing found are: S/A=S/A(sub)implicit, S/Aimplicit=S/A(sub)implicit, S/A=S/A(sub), S/Aimplicit=S/A(sub), partofS/A=S/A(sub), partofS/A=S/A(sub)implicit, S/A=partofS/A(sub), S/A=partofS/A(sub)implicit, G=S/A(sub)implicit, G=S/A(sub), P=S/A(sub)implicit, P=S/A(sub). 


form1_super: This column provides the grammatical form of the co-referent argument in the superordinate SoA: Verb-index (the S/A-argument is expressed only in the verbal ending), Verb imps (the verb is an impersonal), NP (noun phrase), PP_pro (prepositional phrase with a pronoun), PP_nom (prepositional phrase with a noun), Pro (pronoun), Pro_indep (independent personal pronoun), Pro_dep (dependent personal pronoun), Pro_inf (infixed personal pronoun), Pro_aff (affixed personal pronoun), Posspro (possessive personal pronoun).

form1_sub: This column provides the grammatical form of the co-referent argument in the subordinare SoA: NP (noun phrase), PP_pro (prepositional phrase with a pronoun), PP_nom (prepositional phrase with a noun), Pro (pronoun), Pro_indep (independent personal pronoun), Pro_dep (dependent personal pronoun), Pro_inf (infixed personal pronoun), Pro_aff (affixed personal pronoun), Posspro (possessive personal pronoun).

VN: This column provides the citation form of the VN used in the PPVN-phrase.

TAM-particle: This column shows the use of TAM-particles. The data lnly provides the use of the particle ry. 

adv_mod: Any adverbial modification of the PPVN-phrase is provided in this column.

VN_or_N: This column provides information of whether the VN used in the PPVN-phrase is a clear VN or homonymous with a noun proper.  

transitivity: In this column the VN used in the PPVN-phrase is classed as transitive, intransitive, either (transitive or intransitive) or reflexive. 

Vendler: This column provides information on the predicate type of the VN used in the PPVN-phrase following Vendler's classification of accomplishment, achievement, activity, state predicates.

## Script

The R-script was developed by Michael Cysouw and had some changes made by Magnus Breder Birkenes.


## License

This project is licensed under the Creative Commons Zero v1.0 Universal - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* Innumerable thanks to Michael Cysouw for writing the R-script and interpreting the results.
* Many thanks to Magnus Breder Birkenes for his patience and help with adapting Michael's script.

## Ricarda Scherschel 17/3/2020
