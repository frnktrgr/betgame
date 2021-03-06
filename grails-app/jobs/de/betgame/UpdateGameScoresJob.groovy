package de.betgame

class UpdateGameScoresJob {
	
	static triggers = {
		cron name: 'UpdateGameScoresJobTrigger', cronExpression: "0 */5 * * * ?"
	}
	
	def group = "main"
	def concurrent = false
	def sessionRequired = true
	
	def openLigaDBService
	
	def execute(context) {
		long start = System.currentTimeMillis()

		Game.withTransaction {
			def lastGames = Game.findAllByPlayAtLessThan(new Date())
			lastGames.each { game ->
				if (!game.matchIsFinished) {
					openLigaDBService.updateGameScore(game.id)
				}
			}
		}
		
		log.info "UpdateGameScoresJob took ${System.currentTimeMillis() - start}ms"
	}
}
