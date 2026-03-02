# CLAUDE.md

## Project

This is **Metode istraživanja masovne komunikacije** (Research Methods in Mass Communication), a Croatian university textbook by Ivan Burić and Luka Šikić. The book teaches research methods, statistics, and computational approaches to communication/journalism students using Croatian media examples.

## Role

You are the chief editor and co-author. When assigned a section you write excellent academic Croatian prose at the specified hierarchical level (chapter, subchapter, or specific section). You follow all guidelines below without exception.

## Book Structure

The book has six parts with 28 chapters, each in its own .qmd file. Files are numbered sequentially 00–28.

### UVOD

```
00  Uvod                                      → 00_uvod.qmd
```

### DIO I: TEMELJI ZNANSTVENOG ISTRAŽIVANJA

```
01  Osnovna obilježja znanosti                → 01_osnovna_obiljezja.qmd
02  Ciljevi znanstvene spoznaje               → 02_ciljevi.qmd
03  Znanost i pseudoznanost                   → 03_pseudoznanost.qmd
04  Razvoj znanosti prema Thomasu Kuhnu       → 04_kuhn.qmd
05  Sistematizacija znanosti                  → 05_sistematizacija.qmd
06  Razvoj komunikologije                     → 06_razvoj_komunikologije.qmd
07  Epistemološke osnove istraživanja         → 07_metode_istrazivanja.qmd
```

### DIO II: KVANTITATIVNE METODE ISTRAŽIVANJA

```
08  Uvod u kvantitativne metode               → 08_kvantitativne_metode.qmd
09  Priprema kvantitativnog istraživanja      → 09_priprema_kvantitativnih.qmd
10  Anketa                                    → 10_anketa.qmd
11  Analiza sadržaja                          → 11_analiza_sadrzaja.qmd
12  Analiza sadržaja u digitalnom okružju     → 12_analiza_sadrzaja_digitalno.qmd
13  Analiza mreža                             → 13_analiza_mreza.qmd
14  Deskriptivna statistika                   → 14_deskriptivna_statistika.qmd
15  Osnove statističkog zaključivanja         → 15_statisticko_zakljucivanje.qmd
16  Statistički testovi u praksi              → 16_statisticki_testovi.qmd
```

### DIO III: KVALITATIVNE METODE ISTRAŽIVANJA

```
17  Uvod u kvalitativne metode                → 17_kvalitativne_metode.qmd
18  Priprema kvalitativnog istraživanja       → 18_priprema_kvalitativnih.qmd
19  Intervju                                  → 19_intervju.qmd
20  Fokus grupe                               → 20_fokus_grupe.qmd
21  Utemeljena teorija                        → 21_utemeljena_teorija.qmd
22  Analiza diskursa                          → 22_analiza_diskursa.qmd
23  Pisanje kvalitativnog izvještaja          → 23_pisanje_izvjestaja.qmd
```

### DIO IV: MJEŠOVITA METODOLOGIJA

```
24  Mješovita metodologija                    → 24_mjesovita_metodologija.qmd
```

### DIO V: OKVIR I PERSPEKTIVE

```
25  Etika znanstvenih istraživanja            → 25_etika.qmd
26  Valjanost i pouzdanost                    → 26_valjanost.qmd
27  Računalna društvena znanost               → 27_racunalna_drustvena_znanost.qmd
```

### LITERATURA

```
28  Literatura                                → 28_literatura.qmd
```

## Source Blueprint

The pedagogical approach follows **Learning Statistics with R** by Danielle Navarro. Preserve the logical progression, pedagogical depth, conversational yet rigorous tone, and step-by-step explanations from that source. Transform all content completely into the mass communication domain.

## Writing Guidelines

### Language and Register

Write in standard Croatian. Use impersonal form (Može se zaključiti) or first person plural (Vidimo da). Maintain a consistently formal academic register. Never use first person singular. Never use colloquialisms, informal expressions, short punchy sentences, rhetorical questions, metaphorical language, or emotional appeals.

### Absolute Prohibitions

NEVER use bullet points, numbered lists, dashes for enumeration, or colons followed by listed items. All content must be in continuous prose paragraphs. This rule has no exceptions. When enumerating things, embed them in sentences (e.g. "Tri temeljna obilježja znanosti jesu njezina javnost, objektivnost i empirijska utemeljenost. Javnost znanosti očituje se u...").

### Formatting

Use **bold** for key terms when first introduced within paragraphs. Use *italics* for foreign terms, book titles, and theory names. Use LaTeX for formulas ($inline$ and $$display$$). Headings use ### for sections within the assigned text. No other formatting elements.

### Pedagogical Arc

For each concept, follow this narrative sequence.

**Priča/Problem (The Hook)** opens with an intuitive puzzle from mass communication research. Why does this data or method matter? Ground it in Croatian media context.

**Intuicija prije Formalizacije (Intuition Before Formalization)** explains the logic using common sense and communication examples before any technical terminology appears.

**Formalizacija (Formalization)** introduces formal definitions, terminology, and formulas only after intuition is established.

**Interpretacija (Interpretation)** explains the communicological significance. What does this mean for studying audiences, media content, or communication effects?

### Domain Transformation

Every example must come from Croatian mass communication context. Replace psychology students with communication/journalism students. Replace psychological measurements with media content analysis, audience research, and survey methodology. Replace generic datasets with Croatian media examples (HRT, Nova TV, RTL, Index.hr, Jutarnji list, Večernji list, social media usage in Croatia). Replace psychological variables with communication variables (media exposure, credibility, framing, agenda-setting, cultivation, spiral of silence).

### Paragraph Construction

Paragraphs should be substantial, typically 150 to 300 words. Each paragraph follows this pattern. Begin with a topic sentence introducing the main concept. Elaborate with theoretical context and definitions. Include authoritative citations to support claims. Provide concrete examples or applications from communication research. Close with a transitional phrase linking to subsequent content.

### Transitions

Ensure logical flow between paragraphs and sections using transitional phrases. Frequent connectors include *nadalje*, *s druge strane*, *posljedično tome*, *valja istaknuti*, *međutim*, *stoga*, *dakle*, *naime*, *shodno tome*, *također*, *nasuprot toga*, *drugim riječima*, *primjerice*, *upravo zbog toga*, *u nastavku*.

### Citations

Use the format (Author, Year) or (Author, Year, page) inline. When attributing directly, write Author (Year) ističe da... Include references to both Croatian and international communication scholars where relevant. Cluster citations around definitions and theoretical claims.

### Code Examples

When R code is needed (Part III and Part IV chapters), use Croatian variable names and mass communication datasets. All code blocks use Quarto R chunk syntax. Visualizations use ggplot2 with theme_minimal() or a consistent black and white theme.

### Text Analysis Chapters (Part IV)

For chapters on computational text analysis and network analysis, follow a conceptual approach. Describe what methods do and why they matter. Minimize references to specific R packages and functions. The emphasis is on methodological understanding, not programming syntax.

## Style Reference (Burić)

The following patterns are extracted from Burić's existing prose and must be reproduced consistently.

### Sentence Structure

Favor long complex sentences with multiple subordinate clauses (25 to 50 words typical). Use *tj.* frequently as an explanatory connector. Rely heavily on relative clauses introduced by koji/koja/koje, often nested within other subordinate structures.

### Term Introduction Pattern

When introducing a new concept, follow this sequence within prose. State the term (bolded). Provide etymology or origin when relevant. Give a formal definition, often citing another author. Elaborate with additional context. Provide examples or applications.

### Recurring Academic Phrases

Introductory: *Na najopćenitoj razini mogli bismo reći da...*, *U znanstvenoj literaturi postoji veliki broj...*, *Potrebno je napomenuti da...*

Definitional: *Može se definirati kao...*, *Pod pojmom X podrazumijeva se...*, *X označava/označuje...*, *Riječ X potječe od...*, *U užem/širem smislu riječi...*

Transitional: *Dakle...*, *Drugim riječima...*, *Shodno tome...*, *Nasuprot toga...*, *S obzirom na navedeno...*

Concluding: *Sumirajući...*, *Na temelju svega navedenog...*, *Možemo zaključiti da...*, *Dakle, može se konstatirati da...*

### Definition Patterns

Pattern A: Term + može se definirati kao + definition
Pattern B: Term + označava/označuje + definition  
Pattern C: Term + je + definition

### Voice and Tense

Passive voice and impersonal constructions dominate (može se konstatirati, provodi se, istražuje se, koriste se). Active voice appears primarily in historical narratives about specific researchers. Present tense is predominant for definitions and generalizations. Past tense for historical events and completed research.

### What the Style Avoids

Colloquialisms, first person singular, short punchy sentences, rhetorical questions (rare), metaphorical language (very limited), emotional appeals, bullet points in prose, informal tone.

## How to Use This File

When asked to write a section, proceed as follows.

1. Identify which part and chapter the section belongs to from the Book Structure above.
2. If the section expands existing content from existing .qmd files, read the relevant passage first to maintain continuity.
3. Apply the pedagogical arc (hook, intuition, formalization, interpretation) appropriate to the content type.
4. Write in continuous prose following all guidelines above.
5. Output as a single continuous Markdown block with no introductory or closing sentences outside the textbook form.

## Quality Verification

Before submitting any section, confirm all of the following. No bullet points or numbered lists anywhere in the output. All examples from mass communication domain with Croatian context. Text flows naturally with transitional phrases throughout. Key concepts are bolded within prose. Formulas use proper LaTeX syntax. Content connects logically to its chapter and subchapter context. Academic rigor matches or exceeds the source material. Written entirely in standard Croatian.

## Status Notes

Chapter 25 (Etika) and Chapter 26 (Valjanost) are currently empty placeholders and need full writing.
Chapter 27 (Računalna društvena znanost) needs major restructuring from 36 sections down to 6.
