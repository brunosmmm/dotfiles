"""Output messages to terminal."""

try:
    from rich.console import Console

    console = Console()

    HAS_RICH = True
except ImportError:
    HAS_RICH = False

builtin_input = input


def error(message):
    """Print an error message."""
    if HAS_RICH:
        console.print(f"[bold red]ERROR: {message}[/bold red]")
    else:
        print(f"ERROR: {message}")


def warning(message):
    """Print a warning message."""
    if HAS_RICH:
        console.print(f"[bold yellow]WARNING: {message}[/bold yellow]")
    else:
        print(f"WARNING: {message}")


def info(message):
    """Print an informational message."""
    if HAS_RICH:
        console.print(f"[bold blue]INFO: {message}[/bold blue]")
    else:
        print(f"INFO: {message}")


def message(_message):
    """Print a message."""
    if HAS_RICH:
        console.print(_message)
    else:
        print(_message)


def input(message):
    """Print a message and return input."""
    if HAS_RICH:
        return console.input(message)
    return builtin_input(message)
