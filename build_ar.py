#!/usr/bin/env python3
"""
Build script for QuickDupe Arabic version.
Generates a unique signature for each compilation.
"""
import subprocess
import uuid
import random
import string
import os
import sys

SOURCE_FILE = "quickdupe_ar.py"
SPEC_FILE = "QuickDupe_ar.spec"
PLACEHOLDER = "__BUILD_ID_PLACEHOLDER__"

def generate_signature():
    """Generate a unique signature - UUID + random string"""
    # UUID for uniqueness
    uid = str(uuid.uuid4()).replace('-', '').upper()[:8]
    # Random string for extra randomness
    rand = ''.join(random.choices(string.ascii_letters, k=10))
    return f"{uid}-{rand}"

def build():
    # Generate unique signature
    signature = generate_signature()
    print(f"[BUILD] Generated unique signature: {signature}")

    # Read source
    with open(SOURCE_FILE, 'r', encoding='utf-8') as f:
        original_source = f.read()

    # Check for placeholder
    if PLACEHOLDER not in original_source:
        print("[WARNING] Placeholder not found in source! Proceeding without signature injection.")
        modified_source = original_source
    else:
        # Replace placeholder with unique signature
        modified_source = original_source.replace(PLACEHOLDER, signature)

    # Write modified source (temp)
    with open(SOURCE_FILE, 'w', encoding='utf-8') as f:
        f.write(modified_source)

    print(f"[BUILD] Injected signature into {SOURCE_FILE}")

    try:
        # Run PyInstaller
        print("[BUILD] Running PyInstaller...")
        # Assuming python -m PyInstaller works on the user's system
        result = subprocess.run(
            [sys.executable, "-m", "PyInstaller", SPEC_FILE, "--noconfirm", "--clean"],
            check=True
        )
        print(f"[BUILD] Success! Signature: {signature}")
        print(f"[BUILD] Executable should be in 'dist' folder.")

    except subprocess.CalledProcessError as e:
        print(f"[ERROR] PyInstaller failed: {e}")
    except Exception as e:
        print(f"[ERROR] An unexpected error occurred: {e}")
    finally:
        # Restore original source (keep clean)
        with open(SOURCE_FILE, 'w', encoding='utf-8') as f:
            f.write(original_source)
        print(f"[BUILD] Restored {SOURCE_FILE} to original state")

if __name__ == "__main__":
    build()
