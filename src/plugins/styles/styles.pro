TEMPLATE = subdirs
QT_FOR_CONFIG += widgets-private

SUBDIRS = plastique

qtConfig(style-android): SUBDIRS += android

qtConfig(style-mac): SUBDIRS += mac

qtConfig(style-windowsvista): SUBDIRS += windowsvista
