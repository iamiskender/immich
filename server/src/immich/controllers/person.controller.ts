import {
  AssetResponseDto,
  AuthUserDto,
  BulkIdResponseDto,
  ImmichReadStream,
  MergePersonDto,
  PersonResponseDto,
  PersonService,
  PersonUpdateDto,
} from '@app/domain';
import { Body, Controller, Get, Param, Post, Put, StreamableFile } from '@nestjs/common';
import { ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { Authenticated, AuthUser } from '../app.guard';
import { UseValidation } from '../app.utils';
import { UUIDParamDto } from './dto/uuid-param.dto';

function asStreamableFile({ stream, type, length }: ImmichReadStream) {
  return new StreamableFile(stream, { type, length });
}

@ApiTags('Person')
@Controller('person')
@Authenticated()
@UseValidation()
export class PersonController {
  constructor(private service: PersonService) {}

  @Get()
  getAllPeople(@AuthUser() authUser: AuthUserDto): Promise<PersonResponseDto[]> {
    return this.service.getAll(authUser);
  }

  @Get(':id')
  getPerson(@AuthUser() authUser: AuthUserDto, @Param() { id }: UUIDParamDto): Promise<PersonResponseDto> {
    return this.service.getById(authUser, id);
  }

  @Put(':id')
  updatePerson(
    @AuthUser() authUser: AuthUserDto,
    @Param() { id }: UUIDParamDto,
    @Body() dto: PersonUpdateDto,
  ): Promise<PersonResponseDto> {
    return this.service.update(authUser, id, dto);
  }

  @Get(':id/thumbnail')
  @ApiOkResponse({
    content: {
      'image/jpeg': { schema: { type: 'string', format: 'binary' } },
    },
  })
  getPersonThumbnail(@AuthUser() authUser: AuthUserDto, @Param() { id }: UUIDParamDto) {
    return this.service.getThumbnail(authUser, id).then(asStreamableFile);
  }

  @Get(':id/assets')
  getPersonAssets(@AuthUser() authUser: AuthUserDto, @Param() { id }: UUIDParamDto): Promise<AssetResponseDto[]> {
    return this.service.getAssets(authUser, id);
  }

  @Post(':id/merge')
  mergePerson(
    @AuthUser() authUser: AuthUserDto,
    @Param() { id }: UUIDParamDto,
    @Body() dto: MergePersonDto,
  ): Promise<BulkIdResponseDto[]> {
    return this.service.mergePerson(authUser, id, dto);
  }
}
