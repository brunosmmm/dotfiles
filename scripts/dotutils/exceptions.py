"""Dotfile related exceptions."""


class DotfileException(Exception):
    """General exception."""

    pass


class DotfileFatalError(DotfileException):
    """Fatal error."""

    def __init__(self, inner_ex, **kwargs):
        """Initialize."""
        self._exception = inner_ex

    @property
    def inner_ex(self):
        """Get inner exception."""
        return self._exception
