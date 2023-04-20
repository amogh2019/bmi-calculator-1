# bmi_calculator


### publish to ghpages
```
# install peanut and update flutter
dart pub global activate peanut && flutter pub get

# generate webapp to publish
flutter pub global run peanut \
--web-renderer canvaskit \
--extra-args "--base-href=/bmi-calculator-1/"

# publish webapp to ghpages
git push origin --set-upstream gh-pages
```