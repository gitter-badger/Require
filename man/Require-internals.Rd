% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Require-helpers.R
\name{getPkgVersions}
\alias{getPkgVersions}
\alias{getAvailable}
\alias{installFrom}
\alias{doInstalls}
\alias{doLoading}
\alias{archiveVersionsAvailable}
\title{Internals used by \code{Require}}
\usage{
getPkgVersions(pkgDT, install = TRUE)

getAvailable(pkgDT, purge = FALSE, repos = getOption("repos"))

installFrom(pkgDT, purge = FALSE, repos = getOption("repos"))

doInstalls(
  pkgDT,
  install_githubArgs,
  install.packagesArgs,
  install = TRUE,
  repos = getOption("repos"),
  ...
)

doLoading(pkgDT, require = TRUE, ...)

archiveVersionsAvailable(package, repos)
}
\arguments{
\item{pkgDT}{A character string with full package names or a data.table
with at least 2 columns \code{"Package"} and \code{"packageFullName"}.}

\item{install}{Logical or "force". If \code{FALSE}, this will not try to
install anything. If \code{"force"}, then it will force installation of
requested packages, mimicking a call to e.g., \code{install.packages}. If
\code{TRUE}, the default, then this function will try to install any
missing packages or dependencies.}

\item{purge}{Logical. Should all caches be purged Default is 
\code{getOption("Require.purge", FALSE)}.
There is a lot of internal caching of results throughout 
the \code{Require} package. These help with speed and reduce calls to internet sources.
However, sometimes these caches must be purged. The cached values are renewed 
when found to be too old, with the age limit. 
This maximum age can be set in seconds with the environment variable 
\code{R_AVAILABLE_PACKAGES_CACHE_CONTROL_MAX_AGE}, or if unset, 
defaults to 3600  (one hour -- see
\code{\link[utils]{available.packages}}).

Internally, there are calls to \code{available.packages}}

\item{repos}{The remote repository (e.g., a CRAN mirror), passed to either
\code{install.packages}, \code{install_github} or \code{installVersions}.}

\item{install_githubArgs}{List of optional named arguments, passed to \code{install_github}.}

\item{install.packagesArgs}{List of optional named arguments, passed to \code{install.packages}.}

\item{...}{Passed to \emph{all} of \code{install_github},
\code{install.packages}, and \code{remotes::install_version}, i.e., the
function will error if all of these functions can not use the ... argument.
Good candidates are e.g., \code{type} or \code{dependencies}. This can be
used with \code{install_githubArgs} or \code{install.packageArgs} which
give individual options for those 2 internal function calls.}

\item{require}{Logical. If \code{TRUE}, the default, then the function will
attempt to call \code{require} on all requested \code{packages}, possibly
after they are installed.}

\item{package}{A single package name (without version or github specifications)}
}
\value{
In general, these functions return a data.table with various package
information, installation status, version, available version etc.
}
\description{
While these are not intended to be called manually by users, they may be
of some use for advanced users.
}
\details{
\code{doInstall} is a wrapper around \code{install.packages},
\code{remotes::install_github}, and \code{remotes::install_version}.

\code{doLoading} is a wrapper around \code{require}.

\code{archiveVersionsAvailable} searches CRAN Archives for available versions.
It has been borrowed from a sub-set of the code in a non-exported function:
\code{remotes:::download_version_url}
}
