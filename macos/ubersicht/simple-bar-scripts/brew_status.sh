export PATH="/opt/homebrew/bin:$PATH"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

if [ "$COUNT" -eq 0 ]; then
  echo "🟩 $COUNT"
elif [ "$COUNT" -lt 12 ]; then
  echo "🟨 $COUNT"
else
  echo "🟥 $COUNT"
fi
