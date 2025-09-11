# My DevContainer Template

A comprehensive Python development environment template using Visual Studio Code DevContainers with Jupyter Lab support, optimized for data science and machine learning workflows.

## 🚀 Features

- **Python 3.13** development environment
- **Jupyter Lab** with full extension support
- **UV package manager** for fast dependency management
- **Pre-configured VS Code extensions** for Python development
- **Zsh with Oh My Zsh** for an enhanced terminal experience
- **Optimized container configuration** with 16GB memory and 8 CPU cores
- **Auto-activation** of virtual environment on terminal startup
- **Tokyo timezone** pre-configured

## 📋 Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## 🛠️ Getting Started

### 1. Use This Template

Click the "Use this template" button on GitHub or clone the repository:

```bash
git clone https://github.com/yourusername/my-devcontainer-template.git
cd my-devcontainer-template
```

### 2. Open in DevContainer

1. Open the project folder in VS Code
2. When prompted, click "Reopen in Container" or use the Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) and select "Dev Containers: Reopen in Container"
3. Wait for the container to build and configure (first time may take a few minutes)

### 3. Start Development

Once the container is ready, you can:

- Run the sample script: `python main.py`
- Launch Jupyter Lab: The container forwards port 8888 for Jupyter Lab access
- Start coding with full IntelliSense and debugging support

## 📦 Included Packages

### Core Development Tools
- **Jupyter Lab** - Interactive development environment
- **IPyKernel** - Jupyter kernel for Python
- **IPyWidgets** - Interactive widgets for Jupyter notebooks

### VS Code Extensions
- Python language support with Pylance
- Jupyter extension pack
- Black formatter and Ruff linter
- GitHub Copilot integration
- Git Graph and GitLens
- Japanese language pack
- Docker and container support

## 🔧 Configuration

### Container Resources
The devcontainer is configured with:
- **Memory**: 16GB with 32GB swap
- **CPU**: 8 cores
- **Shared Memory**: 4GB
- **OOM Kill**: Disabled

### Package Management
This template uses [UV](https://github.com/astral-sh/uv) for fast Python package management:

```bash
# Add new dependencies
uv add package-name

# Install development dependencies
uv add --dev pytest black ruff

# Sync dependencies
uv sync
```

### Virtual Environment
The virtual environment is automatically activated in new terminal sessions. The environment is located at `.venv/` in the project root.

## 📁 Project Structure

```
my-devcontainer-template/
├── .devcontainer/
│   ├── devcontainer.json    # DevContainer configuration
│   └── setup.sh            # Environment setup script
├── .venv/                  # Virtual environment (created automatically)
├── main.py                 # Sample Python script
├── pyproject.toml          # Project dependencies and metadata
├── uv.lock                 # Lock file for reproducible builds
├── .python-version         # Python version specification
└── .gitignore             # Git ignore rules
```

## 🚀 Usage Examples

### Running Python Scripts
```bash
python main.py
```

### Using Jupyter Lab
Jupyter Lab is accessible on port 8888. The container automatically forwards this port, so you can access it at `http://localhost:8888` once the container is running.

### Adding Dependencies
```bash
# Add a new package
uv add pandas numpy matplotlib

# Add development dependencies
uv add --dev pytest black ruff mypy

# Install from requirements
uv add -r requirements.txt
```

### Working with Notebooks
The environment includes IPython kernel registration, so your virtual environment will be available in Jupyter Lab as "Python 3 (uv)".

## 🔄 Customization

### Adding New Dependencies
Edit `pyproject.toml` to add new dependencies:

```toml
[project]
dependencies = [
    "ipykernel>=6.30.1",
    "jupyter>=1.1.1",
    "jupyterlab>=4.4.7",
    "pandas>=2.0.0",  # Add your dependencies here
]
```

Then run `uv sync` to install them.

### Modifying VS Code Settings
Edit `.devcontainer/devcontainer.json` to customize VS Code extensions and settings:

```json
{
    "customizations": {
        "vscode": {
            "extensions": [
                // Add your preferred extensions here
            ],
            "settings": {
                // Add your VS Code settings here
            }
        }
    }
}
```

### Container Configuration
Modify `.devcontainer/devcontainer.json` to adjust container resources:

```json
{
    "runArgs": [
        "--memory=8g",         # Adjust memory allocation
        "--memory-swap=16g",   # Adjust swap
        "--cpus=4"            # Adjust CPU cores
    ]
}
```

## 🐛 Troubleshooting

### Container Build Issues
- Ensure Docker is running and has sufficient resources
- Try rebuilding the container: "Dev Containers: Rebuild Container"
- Check Docker logs for specific error messages

### Package Installation Problems
- Verify `pyproject.toml` syntax is correct
- Try clearing UV cache: `uv cache clean`
- Rebuild the container to start fresh

### Jupyter Lab Not Accessible
- Verify port 8888 is properly forwarded in the container
- Check that no other services are using port 8888
- Restart the container if needed
