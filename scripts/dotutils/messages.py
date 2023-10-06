"""Output messages to terminal."""

try:
    from rich import print

    HAS_RICH = True
except ImportError:
    HAS_RICH = False


def error(message):
    """Print an error message."""
    if HAS_RICH:
        print(f"[bold red]ERROR: {message}[/bold red]")
    else:
        print(f"ERROR: {message}")


def warning(message):
    """Print a warning message."""
    if HAS_RICH:
        print(f"[bold yellow]WARNING: {message}[/bold yellow]")
    else:
        print(f"WARNING: {message}")


def info(message):
    """Print an informational message."""
    if HAS_RICH:
        print(f"[bold blue]INFO: {message}[/bold blue]")
    else:
        print(f"INFO: {message}")


def message(_message):
    """Print a message."""
    print(_message)
