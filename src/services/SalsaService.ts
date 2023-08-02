import { prisma } from '@shared/client'
import { v4 as uuidv4 } from 'uuid'

async function initGame(code: string, isDemo: boolean) {

    const search = await prisma.salsa_games.findFirst({ where: { code } })

    if (!search) {
        return { success: false, message: 'Jogo não localizado!' }
    }

    const uuid = uuidv4() as string
    const pn = 'betcreating'
    const type = (isDemo) ? 'FREE' : 'CHARGED'
    const name = search.code

    return { success: true, message: 'Jogo Encontrado', urlInit: `https://api-test.salsagator.com/game?token=${uuid}&pn=${pn}&lang=pt&game=${name}&type=${type}` }
}

async function seedersGames() {
    const games = [
        {
            name: 'Super Hot Bingo',
            code: 'shb',
            created_at: new Date(),
            updated_at: new Date()
        },
        {
            name: 'Super Pachinko',
            code: 'sp',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Show Ball',
            code: 'sbp',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Zodiac',
            code: 'zb',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Flex',
            code: 'sf',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Candy',
            code: 'cb',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Goal',
            code: 'gb',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Pirate',
            code: 'pb',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Pachinko5',
            code: 'p75',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Farm',
            code: 'farm',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Super Pachinko Plus',
            code: 'spp',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Pachinko 3D',
            code: 'p3d',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Candy 3D',
            code: 'c3d',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Halloween Groove Bingo',
            code: 'hgb',
            created_at: new Date(),
            updated_at: new Date()
        }, {
            name: 'Jogo dos Bichos Praia',
            code: 'jbp',
            created_at: new Date(),
            updated_at: new Date()
        }
    ]

    const create = await prisma.salsa_games.createMany({ data: games })
}

const SalsaService = { initGame, seedersGames }

export default SalsaService
