# log file name
LOG_FILE="livecheck.log"

# website array
SITES=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://www.tiktok.com"
)

# clean/create log file
> "$LOG_FILE"

# for cycle to check each site
for URL in "${SITES[@]}"; do
    #get http code status
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "$URL")

  # define up or down
  if [[ "$HTTP_CODE" -eq 200 ]]; then
    STATUS="UP"
  else
    STATUS="DOWN"
  fi

  # format entry
  ENTRY="<${URL}> is ${STATUS}"

  # save in log and print to console
  echo "$ENTRY" >> "$LOG_FILE"
done

# print result after all checks
echo "Перевірка завершена — результати записані у файл $LOG_FILE"
