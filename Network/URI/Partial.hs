module Network.URI.Partial (PartialURI, relativeTo) where

import Network.URI (URI)
import qualified Network.URI as URI
import Data.String (IsString(..))

newtype PartialURI = PartialURI URI deriving (Show, Eq)

relativeTo :: PartialURI -> URI -> URI
relativeTo (PartialURI p) base = p `URI.relativeTo` base

instance IsString PartialURI where
	fromString s = let Just u = URI.parseRelativeReference s in PartialURI u
