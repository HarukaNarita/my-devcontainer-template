#!/bin/bash
set -e

echo "🔧 Setting up Python development environment with uv..."

# Clean up
sudo rm -rf /var/lib/apt/lists/*

# Install uv (Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.cargo/bin:$PATH"

# Verify uv installation
uv --version

# Create virtual environment in project directory
uv venv .venv --python 3.13

# Activate virtual environment
source .venv/bin/activate

# Install dependencies if pyproject.toml exists
if [ -f "pyproject.toml" ]; then
    echo "📦 Installing dependencies with uv..."
    uv sync
    
    # Setup Jupyter kernel for uv environment
    uv run python -m ipykernel install --user --name uv-env --display-name 'Python 3 (uv)'
else
    echo "⚠️  No pyproject.toml found. Installing basic Jupyter packages..."
    uv init --no-readme
    uv add jupyter jupyterlab ipykernel
    
    # Setup Jupyter kernel
    uv run python -m ipykernel install --user --name uv-env --display-name 'Python 3 (uv)'
fi

echo '✅ uv environment setup completed!'

if ! grep -q "Auto-activate uv virtual environment" ~/.bashrc; then
    cat >> ~/.bashrc << 'EOF'

# Auto-activate uv virtual environment
if [ -f "$PWD/.venv/bin/activate" ]; then
    source "$PWD/.venv/bin/activate"
fi
EOF
fi

echo "✅ Added auto-activation of uv virtual environment to ~/.bashrc"