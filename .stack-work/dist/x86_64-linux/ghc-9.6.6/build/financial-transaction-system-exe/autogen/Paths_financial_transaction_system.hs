{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_financial_transaction_system (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/bin"
libdir     = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/lib/x86_64-linux-ghc-9.6.6/financial-transaction-system-0.1.0.0-yXDNls1x5r2go9KnV5HK0-financial-transaction-system-exe"
dynlibdir  = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/lib/x86_64-linux-ghc-9.6.6"
datadir    = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/share/x86_64-linux-ghc-9.6.6/financial-transaction-system-0.1.0.0"
libexecdir = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/libexec/x86_64-linux-ghc-9.6.6/financial-transaction-system-0.1.0.0"
sysconfdir = "/home/konkon/atelier/haskell/financial-transaction-system/.stack-work/install/x86_64-linux/f1d823dd49d9aac364df2997c5e2e8cdccc14cc84952e02226ab77eb176938fe/9.6.6/etc"

getBinDir     = catchIO (getEnv "financial_transaction_system_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "financial_transaction_system_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "financial_transaction_system_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "financial_transaction_system_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "financial_transaction_system_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "financial_transaction_system_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
