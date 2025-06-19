function gcp --argument-names ms
	git add . && git commit -m "$ms" && git push
end
