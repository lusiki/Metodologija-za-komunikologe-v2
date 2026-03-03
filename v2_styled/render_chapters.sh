#!/bin/bash
# Render each chapter individually in HTML, DOCX, and PDF formats
# Uses a temporary directory to avoid book project interference
# Output organized into html/, pdf/, docx/ subfolders

QUARTO="/c/Program Files/RStudio/resources/app/bin/quarto/bin/quarto.exe"
SRCDIR="C:/Users/lsikic/Dropbox/Metodologija-za-komunikologe-v2/v2_styled"
OUTDIR="$SRCDIR/output"
TMPDIR="$SRCDIR/_tmp_render"

# All chapter files to render
CHAPTERS=(
  "00_uvod"
  "01_osnovna_obiljezja"
  "02_ciljevi"
  "03_pseudoznanost"
  "04_kuhn"
  "05_sistematizacija"
  "06_razvoj_komunikologije"
  "07_metode_istrazivanja"
  "08_kvantitativne_metode"
  "09_priprema_kvantitativnih"
  "10_anketa"
  "11_analiza_sadrzaja"
  "12_analiza_sadrzaja_digitalno"
  "13_analiza_mreza"
  "14_deskriptivna_statistika"
  "15_statisticko_zakljucivanje"
  "16_statisticki_testovi"
  "17_kvalitativne_metode"
  "18_priprema_kvalitativnih"
  "19_intervju"
  "20_fokus_grupe"
  "21_utemeljena_teorija"
  "22_analiza_diskursa"
  "23_pisanje_izvjestaja"
  "24_mjesovita_metodologija"
  "25_etika"
  "26_valjanost"
  "27_racunalna_drustvena_znanost"
  "28_literatura"
)

# Create organized output directories
mkdir -p "$OUTDIR/html"
mkdir -p "$OUTDIR/pdf"
mkdir -p "$OUTDIR/docx"
mkdir -p "$TMPDIR"

# Copy freeze data if available
if [ -d "$SRCDIR/_freeze" ]; then
  cp -r "$SRCDIR/_freeze" "$TMPDIR/_freeze"
fi

# Create a minimal _quarto.yml for standalone rendering
cat > "$TMPDIR/_quarto.yml" << 'YAMLEOF'
project:
  type: default

execute:
  freeze: auto
  warning: false
  message: false
YAMLEOF

# Copy the existing docx for chapter 13 (already styled and approved)
if [ -f "$SRCDIR/13_analiza_mreza_docx.docx" ]; then
  cp "$SRCDIR/13_analiza_mreza_docx.docx" "$OUTDIR/docx/13_analiza_mreza.docx"
  echo "[INFO] Copied existing styled DOCX for chapter 13"
fi

# Track results
SUCCESS=0
FAIL=0
SKIP=0

for ch in "${CHAPTERS[@]}"; do
  echo "============================================"
  echo "Processing: ${ch}.qmd"
  echo "============================================"

  # Check source file exists
  if [ ! -f "$SRCDIR/${ch}.qmd" ]; then
    echo "  [SKIP] Source file not found: ${ch}.qmd"
    SKIP=$((SKIP + 1))
    continue
  fi

  # Copy the chapter file to temp dir
  cp "$SRCDIR/${ch}.qmd" "$TMPDIR/${ch}.qmd"

  # Copy any associated _files directories (for R code output figures)
  if [ -d "$SRCDIR/${ch}_files" ]; then
    cp -r "$SRCDIR/${ch}_files" "$TMPDIR/${ch}_files"
  fi

  # --- Render HTML ---
  echo "  -> Rendering HTML..."
  "$QUARTO" render "$TMPDIR/${ch}.qmd" --to html \
    -M self-contained:true \
    -M toc:true \
    -M toc-depth:3 \
    -M number-sections:true \
    -M code-fold:true \
    -M lang:hr \
    --output "${ch}.html" 2>&1
  if [ $? -eq 0 ] && [ -f "$TMPDIR/${ch}.html" ]; then
    mv "$TMPDIR/${ch}.html" "$OUTDIR/html/${ch}.html"
    echo "  [OK] HTML -> output/html/${ch}.html"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "  [FAIL] HTML: ${ch}.html"
    FAIL=$((FAIL + 1))
  fi

  # --- Render DOCX ---
  # Skip DOCX for chapter 13 (use pre-existing styled version)
  if [ "$ch" = "13_analiza_mreza" ]; then
    echo "  [SKIP] DOCX for ch13 - using pre-styled version"
    SKIP=$((SKIP + 1))
  else
    echo "  -> Rendering DOCX..."
    "$QUARTO" render "$TMPDIR/${ch}.qmd" --to docx \
      -M toc:true \
      -M toc-depth:3 \
      -M number-sections:true \
      -M prefer-html:true \
      -M fig-width:6 \
      -M fig-height:4 \
      -M fig-dpi:300 \
      -M lang:hr \
      --output "${ch}.docx" 2>&1
    if [ $? -eq 0 ] && [ -f "$TMPDIR/${ch}.docx" ]; then
      mv "$TMPDIR/${ch}.docx" "$OUTDIR/docx/${ch}.docx"
      echo "  [OK] DOCX -> output/docx/${ch}.docx"
      SUCCESS=$((SUCCESS + 1))
    else
      echo "  [FAIL] DOCX: ${ch}.docx"
      FAIL=$((FAIL + 1))
    fi
  fi

  # --- Render PDF ---
  echo "  -> Rendering PDF..."
  "$QUARTO" render "$TMPDIR/${ch}.qmd" --to pdf \
    -M toc:true \
    -M toc-depth:3 \
    -M number-sections:true \
    -M documentclass:scrreprt \
    -M papersize:a4 \
    -M fig-width:6 \
    -M fig-height:4 \
    -M fig-dpi:300 \
    -M lang:hr \
    --output "${ch}.pdf" 2>&1
  if [ $? -eq 0 ] && [ -f "$TMPDIR/${ch}.pdf" ]; then
    mv "$TMPDIR/${ch}.pdf" "$OUTDIR/pdf/${ch}.pdf"
    echo "  [OK] PDF -> output/pdf/${ch}.pdf"
    SUCCESS=$((SUCCESS + 1))
  else
    echo "  [FAIL] PDF: ${ch}.pdf"
    FAIL=$((FAIL + 1))
  fi

  echo ""
done

# Cleanup temp directory
rm -rf "$TMPDIR"

echo "============================================"
echo "DONE: $SUCCESS succeeded, $FAIL failed, $SKIP skipped"
echo "============================================"
echo ""
echo "Output structure:"
echo "  output/html/ - HTML versions (self-contained)"
echo "  output/pdf/  - PDF versions (A4, scrreprt)"
echo "  output/docx/ - Word versions"
echo ""
echo "--- HTML ---"
ls -1 "$OUTDIR/html/" 2>/dev/null
echo ""
echo "--- PDF ---"
ls -1 "$OUTDIR/pdf/" 2>/dev/null
echo ""
echo "--- DOCX ---"
ls -1 "$OUTDIR/docx/" 2>/dev/null
