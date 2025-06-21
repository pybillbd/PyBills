# This workflow will upload a Python Package to PyPI when a release is created
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python#publishing-to-package-registries

# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.

name: Upload Python Package

on:
  release:
    types: [published]

permissions:
  contents: read

jobs:
  release-build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v5
        with:
          python-version: "3.x"

      - name: Build release distributions
        run: |
          # NOTE: put your own distribution build steps here.
          python -m pip install build
          python -m build

      - name: Upload distributions
        uses: actions/upload-artifact@v4
        with:
          name: release-dists
          path: dist/

  pypi-publish:
    runs-on: ubuntu-latest
    needs:
      - release-build
    permissions:
      # IMPORTANT: this permission is mandatory for trusted publishing
      id-token: write

    # Dedicated environments with protections for publishing are strongly recommended.
    # For more information, see: https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#deployment-protection-rules
    environment:
      name: pypi
      # OPTIONAL: uncomment and update to include your PyPI project URL in the deployment status:
      # url: https://pypi.org/p/YOURPROJECT
      #
      # ALTERNATIVE: if your GitHub Release name is the PyPI project version string
      # ALTERNATIVE: exactly, uncomment the following line instead:
      # url: https://pypi.org/project/YOURPROJECT/${{ github.event.release.name }}

    steps:
      - name: Retrieve release distributions
        uses: actions/download-artifact@v4
        with:
          name: release-dists
          path: dist/

      - name: Publish release distributions to PyPI
        uses: pypa/gh-action-pypi-publish@release/v1
        with:
          packages-dir: dist/
# This workflow will upload a Python Package to PyPI when a release is created
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python#publishing-to-package-registries

# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.

name: Upload Python Package

on:
  release:
    types: [published]

permissions:
  contents: read

jobs:
  release-build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v5
        with:
          python-version: "3.x"

      - name: Build release distributions
        run: |
          # NOTE: put your own distribution build steps here.
          python -m pip install build
          python -m build

      - name: Upload distributions
        uses: actions/upload-artifact@v4
        with:
          name: release-dists
          path: dist/

  pypi-publish:
    runs-on: ubuntu-latest
    needs:
      - release-build
    permissions:
      # IMPORTANT: this permission is mandatory for trusted publishing
      id-token: write

    # Dedicated environments with protections for publishing are strongly recommended.
    # For more information, see: https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#deployment-protection-rules
    environment:
      name: pypi
      # OPTIONAL: uncomment and update to include your PyPI project URL in the deployment status:
      # url: https://pypi.org/p/YOURPROJECT
      #
      # ALTERNATIVE: if your GitHub Release name is the PyPI project version string
      # ALTERNATIVE: exactly, uncomment the following line instead:
      # url: https://pypi.org/project/YOURPROJECT/${{ github.event.release.name }}

    steps:
      - name: Retrieve release distributions
        uses: actions/download-artifact@v4
        with:
          name: release-dists
          path: dist/

      - name: Publish release distributions to PyPI
        uses: pypa/gh-action-pypi-publish@release/v1
        with:
          packages-dir: dist/
          <!DOCTYPE html>
<html lang="bn">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pybill.com - ডিজিটাল এডুকেশন ওয়ালেট</title>
  <style>
    body {
      font-family: 'SolaimanLipi', sans-serif;
      background: linear-gradient(to right, #e0f7fa, #ffffff);
      margin: 0;
      padding: 0;
      color: #333;
    }

    .hero {
      padding: 40px 20px;
      text-align: center;
      background: #f0f8ff;
      border-bottom: 2px solid #00bcd4;
    }

    .hero h1 {
      font-size: 32px;
      color: #00796b;
      margin-bottom: 10px;
    }

    .hero h2 {
      font-size: 20px;
      color: #009688;
      margin-bottom: 20px;
    }

    .hero p {
      font-size: 18px;
      line-height: 1.6;
      margin-bottom: 10px;
      max-width: 800px;
      margin-left: auto;
      margin-right: auto;
    }

    .highlight {
      background-color: #e0f2f1;
      padding: 10px;
      border-left: 4px solid #00796b;
      margin: 20px 0;
    }

    @media (max-width: 600px) {
      .hero h1 {
        font-size: 24px;
      }

