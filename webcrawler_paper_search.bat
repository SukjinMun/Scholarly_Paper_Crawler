@echo off
setlocal enabledelayedexpansion
REM Save the current directory
set CURRENT_DIR=%cd%
REM Change to the directory where the batch file is located
cd /d %~dp0
REM Upgrade pip and setuptools to improve dependency handling
python -m pip install --upgrade pip setuptools wheel --quiet
REM Install required Python packages
python -m pip install --upgrade requests beautifulsoup4 openpyxl selenium webdriver_manager PyPDF2 cloudscraper nltk scholarly pubchempy backoff urllib3 fake-useragent stem --quiet
REM Download required NLTK data silently
python -c "import nltk; nltk.download('punkt', quiet=True)"
REM Run the Python script
python scripts\webcrawler_paper_search.py
REM Change back to the original directory
cd %CURRENT_DIR%
REM Prompt the user to press any key to continue
pause